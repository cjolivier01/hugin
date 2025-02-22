// -*- c-basic-offset: 4 -*-

/** @file linefind.cpp
 *
 *  @brief program to find vertical lines in project
 *
 *  @author T. Modes
 *
 */

/*  This program is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU General Public
 *  License as published by the Free Software Foundation; either
 *  version 2 of the License, or (at your option) any later version.
 *
 *  This software is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public
 *  License along with this software. If not, see
 *  <http://www.gnu.org/licenses/>.
 *
 */

#include <fstream>
#include <sstream>
#include <getopt.h>
#include <panodata/Panorama.h>
#include <panodata/StandardImageVariableGroups.h>
#include <lines/FindLines.h>
#include <vigra/impex.hxx>
#include <vigra_ext/impexalpha.hxx>
#include <vigra/functorexpression.hxx>
#include <vigra_ext/utils.h>
#include <hugin_utils/openmp_lock.h>
#include <algorithms/optimizer/PTOptimizer.h>

extern "C"
{
#include <pano13/filter.h>
}

static void usage(const char* name)
{
    std::cout << name << ": find vertical lines in images" << std::endl
              << name << " version " << hugin_utils::GetHuginVersion() << std::endl
              << std::endl
              << "Usage:  " << name << " [options] input.pto" << std::endl
              << std::endl
              << "  Options:" << std::endl
              << "     -o, --output=file.pto  Output Hugin PTO file. Default: <filename>_lines.pto" << std::endl
              << "     -i, --image=IMGNR      Work only on given image numbers" << std::endl
              << "     -l, --lines=COUNT      Save maximal COUNT lines (default: 5)" << std::endl
              << "     -h, --help             Shows this help" << std::endl
              << std::endl;
}

// dummy panotools progress functions
static int ptProgress( int command, char* argument )
{
    return 1;
}
static int ptinfoDlg( int command, char* argument )
{
    return 1;
}

/** converts the given image to UInt8RGBImage
 *  only this image is correctly processed by linefind
 *  @param src input image
 *  @param origType pixel type of input image
 *  @param dest converted image
 */
// 2 versions: one for color images, the other for gray images
template <class SrcIMG>
void convertToUInt8(SrcIMG& src, const std::string& origType, vigra::UInt8RGBImage& dest)
{
    dest.resize(src.size());
    long newMax=vigra_ext::getMaxValForPixelType("UINT8");
    // float needs to be from min ... max.
    if (origType == "FLOAT" || origType == "DOUBLE")
    {
        /** @TODO this convert routine scale the input values range into the full scale of UInt16
         *  this is not fully correct
         */
        vigra::RGBToGrayAccessor<vigra::RGBValue<float> > ga;
        vigra::FindMinMax<float> minmax;   // init functor
        vigra::inspectImage(srcImageRange(src, ga),
                            minmax);
        double minVal = minmax.min;
        double maxVal = minmax.max;
        vigra_ext::applyMapping(srcImageRange(src), destImage(dest), minVal, maxVal, 0);
    }
    else
    {
        vigra::transformImage(srcImageRange(src), destImage(dest),
                              vigra::functor::Arg1()*vigra::functor::Param( newMax/ vigra_ext::getMaxValForPixelType(origType)));
    };
}

template <class SrcIMG>
void convertGrayToUInt8(SrcIMG& src, const std::string& origType, vigra::BImage& dest)
{
    dest.resize(src.size());
    long newMax=vigra_ext::getMaxValForPixelType("UINT8");
    // float needs to be from min ... max.
    if (origType == "FLOAT" || origType == "DOUBLE")
    {
        /** @TODO this convert routine scale the input values range into the full scale of UInt16
         *  this is not fully correct
         */
        vigra::FindMinMax<float> minmax;   // init functor
        vigra::inspectImage(srcImageRange(src), minmax);
        double minVal = minmax.min;
        double maxVal = minmax.max;
        vigra_ext::applyMapping(srcImageRange(src), destImage(dest), minVal, maxVal, 0);
    }
    else
    {
        vigra::transformImage(srcImageRange(src), destImage(dest),
                              vigra::functor::Arg1()*vigra::functor::Param( newMax/ vigra_ext::getMaxValForPixelType(origType)));
    };
}

template <class SrcIMG>
vigra::BImage LoadGrayImageAndConvert(vigra::ImageImportInfo& info, vigra::BImage& mask)
{
    vigra::BImage image;
    SrcIMG imageIn(info.width(),info.height());
    if(info.numExtraBands()==1)
    {
        mask.resize(info.width(), info.height());
        vigra::importImageAlpha(info,destImage(imageIn),destImage(mask));
    }
    else
    {
        importImage(info,destImage(imageIn));
    };
    convertGrayToUInt8(imageIn,info.getPixelType(),image);
    imageIn.resize(0,0);
    return image;
};

template <class SrcIMG>
vigra::UInt8RGBImage LoadImageAndConvert(vigra::ImageImportInfo& info, vigra::BImage& mask)
{
    vigra::UInt8RGBImage image;
    SrcIMG imageIn(info.width(),info.height());
    if(info.numExtraBands()==1)
    {
        mask.resize(info.width(), info.height());
        vigra::importImageAlpha(info,destImage(imageIn),destImage(mask));
    }
    else
    {
        importImage(info,destImage(imageIn));
    };
    convertToUInt8(imageIn,info.getPixelType(),image);
    imageIn.resize(0,0);
    return image;
};

// loads the gray images and finds vertical lines, returns a CPVector with found vertical lines
HuginBase::CPVector LoadGrayImageAndFindLines(vigra::ImageImportInfo info, HuginBase::Panorama& pano, size_t imgNr, int nrLines)
{
    vigra::BImage image;
    vigra::BImage mask;
    HuginBase::CPVector lineCp;
    std::string pixelType=info.getPixelType();
    if(pixelType=="UINT8")
    {
        image.resize(info.width(),info.height());
        if(info.numExtraBands()==1)
        {
            mask.resize(info.width(), info.height());
            vigra::importImageAlpha(info,destImage(image),destImage(mask));
        }
        else
        {
            importImage(info,destImage(image));
        };
    }
    else
    {
        if(pixelType=="UINT16" || pixelType=="INT16")
        {
            image=LoadGrayImageAndConvert<vigra::UInt16Image>(info, mask);
        }
        else
        {
            if(pixelType=="INT32" || pixelType=="UINT32")
            {
                image=LoadGrayImageAndConvert<vigra::UInt32Image>(info, mask);
            }
            else
            {
                if(pixelType=="FLOAT" || pixelType=="DOUBLE")
                {
                    image=LoadGrayImageAndConvert<vigra::FImage>(info, mask);
                }
                else
                {
                    std::cerr << "Unsupported pixel type" << std::endl;
                };
            };
        };
    };
    if(image.width()>0 && image.height()>0)
    {
        lineCp=HuginLines::GetVerticalLines(pano, imgNr, image, mask, nrLines);
    };
    return lineCp;
};

// loads the color images and finds vertical lines, returns a CPVector with found vertical lines
HuginBase::CPVector LoadImageAndFindLines(vigra::ImageImportInfo info, HuginBase::Panorama& pano, size_t imgNr, int nrLines)
{
    vigra::UInt8RGBImage image;
    vigra::BImage mask;
    HuginBase::CPVector lineCp;
    std::string pixelType=info.getPixelType();
    if(pixelType=="UINT8")
    {
        image.resize(info.width(),info.height());
        if(info.numExtraBands()==1)
        {
            mask.resize(info.width(), info.height());
            vigra::importImageAlpha(info,destImage(image),destImage(mask));
        }
        else
        {
            importImage(info,destImage(image));
        };
    }
    else
    {
        if(pixelType=="UINT16" || pixelType=="INT16")
        {
            image=LoadImageAndConvert<vigra::UInt16RGBImage>(info, mask);
        }
        else
        {
            if(pixelType=="INT32" || pixelType=="UINT32")
            {
                image=LoadImageAndConvert<vigra::UInt32RGBImage>(info, mask);
            }
            else
            {
                if(pixelType=="FLOAT" || pixelType=="DOUBLE")
                {
                    image=LoadImageAndConvert<vigra::FRGBImage>(info, mask);
                }
                else
                {
                    std::cerr << "Unsupported pixel type" << std::endl;
                };
            };
        };
    };
    if(image.width()>0 && image.height()>0)
    {
        lineCp=HuginLines::GetVerticalLines(pano, imgNr, image, mask, nrLines);
    }
    return lineCp;
};

struct SortVectorByExposure
{
    explicit SortVectorByExposure(const HuginBase::Panorama& pano) : m_pano(pano) {};
    bool operator()(const size_t& img1, const size_t& img2)
    {
        return m_pano.getImage(img1).getExposureValue() < m_pano.getImage(img2).getExposureValue();
    }
private:
    const HuginBase::Panorama& m_pano;
};

static hugin_omp::Lock lock;

int main(int argc, char* argv[])
{
    // parse arguments
    const char* optstring = "o:i:l:h";

    static struct option longOptions[] =
    {
        {"output", required_argument, NULL, 'o' },
        {"image", required_argument, NULL, 'i' },
        {"lines", required_argument, NULL, 'l' },
        {"help", no_argument, NULL, 'h' },
        0
    };

    HuginBase::UIntSet cmdlineImages;
    int c;
    int nrLines = 5;
    std::string output;
    while ((c = getopt_long (argc, argv, optstring, longOptions,nullptr)) != -1)
    {
        switch (c)
        {
            case 'o':
                output = optarg;
                break;
            case 'h':
                usage(hugin_utils::stripPath(argv[0]).c_str());
                return 0;
            case 'i':
                {
                    int imgNr=atoi(optarg);
                    if((imgNr==0) && (strcmp(optarg,"0")!=0))
                    {
                        std::cerr << hugin_utils::stripPath(argv[0]) << ": Could not parse image number." << std::endl;
                        return 1;
                    };
                    cmdlineImages.insert(imgNr);
                };
                break;
            case 'l':
                nrLines=atoi(optarg);
                if(nrLines<1)
                {
                    std::cerr << hugin_utils::stripPath(argv[0]) << ": Could not parse number of lines." << std::endl;
                    return 1;
                };
                break;
            case ':':
            case '?':
                // missing argument or invalid switch
                return 1;
                break;
            default:
                // this should not happen
                abort();
        }
    }

    if (argc - optind != 1)
    {
        if (argc - optind < 1)
        {
            std::cerr << hugin_utils::stripPath(argv[0]) << ": No project file given." << std::endl;
        }
        else
        {
            std::cerr << hugin_utils::stripPath(argv[0]) << ": Only one project file expected." << std::endl;
        };
        return 1;
    };


    std::string input=argv[optind];
    // read panorama
    HuginBase::Panorama pano;
    if (!pano.ReadPTOFile(input, hugin_utils::getPathPrefix(input)))
    {
        return 1;
    };

    // disable progress messages from libpano optimizer
    PT_setProgressFcn(ptProgress);
    PT_setInfoDlgFcn(ptinfoDlg);

    std::vector<size_t> imagesToProcess;
    if(cmdlineImages.empty())
    {
        //no image given, process one image of each stack
        HuginBase::ConstStandardImageVariableGroups variable_groups(pano);
        HuginBase::UIntSetVector imageGroups = variable_groups.getStacks().getPartsSet();
        //get image with median exposure for search for lines
        for (size_t imgGroup = 0; imgGroup < imageGroups.size(); ++imgGroup)
        {
            HuginBase::UIntVector stackImages(imageGroups[imgGroup].begin(), imageGroups[imgGroup].end());
            if (pano.getImage(stackImages[0]).YawisLinked())
            {
                // position is linked, take only image with median exposure for search
                std::sort(stackImages.begin(), stackImages.end(), SortVectorByExposure(pano));
                size_t index = 0;
                if (pano.getImage(*(stackImages.begin())).getExposureValue() != pano.getImage(*(stackImages.rbegin())).getExposureValue())
                {
                    index = stackImages.size() / 2;
                };
                imagesToProcess.push_back(stackImages[index]);
            }
            else
            {
                // stacks are unlinked, search all images
                std::copy(stackImages.begin(), stackImages.end(), std::back_inserter(imagesToProcess));
            };
        };
        if (pano.getNrOfCtrlPoints())
        {
            // pano has already control points, so do a pair-wise optimisation to get
            // rough positions of the images, so we can decide which images are near
            // the zenit/nadir and ignore these images
            HuginBase::Panorama optPano = pano.duplicate();
            // reset translation parameters
            HuginBase::VariableMapVector varMapVec = optPano.getVariables();
            for (size_t i = 0; i < varMapVec.size(); i++)
            {
                map_get(varMapVec[i], "TrX").setValue(0);
                map_get(varMapVec[i], "TrY").setValue(0);
                map_get(varMapVec[i], "TrZ").setValue(0);
            };
            optPano.updateVariables(varMapVec);
            // now do a pairwise optimisation
            HuginBase::AutoOptimise(optPano).run();
            std::vector<size_t> imagesToCheck;
            std::swap(imagesToProcess, imagesToCheck);
            for (auto& img:imagesToCheck)
            {
                // now remove all images from list where pitch > 50 or < -50 -> images near zenit/nadir
                if (std::abs(optPano.getImage(img).getPitch()) < 50)
                {
                    imagesToProcess.push_back(img);
                };
            };
        }
    }
    else
    {
        //check, if given image numbers are valid
        for (HuginBase::UIntSet::const_iterator it = cmdlineImages.begin(); it != cmdlineImages.end(); ++it)
        {
            if((*it)>=0 && (*it)<pano.getNrOfImages())
            {
                imagesToProcess.push_back(*it);
            };
        };
    };

    if(imagesToProcess.empty())
    {
        std::cerr << "No image to process found" << std::endl << "Stopping processing" << std::endl;
        return 1;
    };

    std::cout << hugin_utils::stripPath(argv[0]) << " is searching for vertical lines" << std::endl;
#if _WIN32
    //multi threading of image loading results sometime in a race condition
    //try to prevent this by initialisation of codecManager before
    //running multi threading part
    std::string s=vigra::impexListExtensions();
#endif

    const size_t nrCPS=pano.getNrOfCtrlPoints();
#pragma omp parallel for schedule(dynamic)
    for(int i=0; i < imagesToProcess.size(); ++i)
    {
        const size_t imgNr = imagesToProcess[i];
        std::ostringstream buf;
        buf << "Working on image " << pano.getImage(imgNr).getFilename() << std::endl;
        std::cout << buf.str();
        // now load and process all images
        vigra::ImageImportInfo info(pano.getImage(imgNr).getFilename().c_str());
        HuginBase::CPVector foundLines;
        if(info.isGrayscale())
        {
            foundLines=LoadGrayImageAndFindLines(info, pano, imgNr, nrLines);
        }
        else
        {
            if(info.isColor())
            {
                //colour images
                foundLines=LoadImageAndFindLines(info, pano, imgNr, nrLines);
            }
            else
            {
                std::cerr << "Image " << pano.getImage(imgNr).getFilename().c_str() << " has "
                          << info.numBands() << " channels." << std::endl
                          << "Linefind works only with grayscale or color images." << std::endl
                          << "Skipping image." << std::endl;
            };
        };
        if(!foundLines.empty())
        {
            for (HuginBase::CPVector::const_iterator cpIt = foundLines.begin(); cpIt != foundLines.end(); ++cpIt)
            {
                hugin_omp::ScopedLock sl(lock);
                pano.addCtrlPoint(*cpIt);
            };
        };
    }
    std::cout << std::endl << "Found " << pano.getNrOfCtrlPoints() - nrCPS << " vertical lines" << std::endl << std::endl;

    //write output
    // Set output .pto filename if not given
    output = hugin_utils::GetOutputFilename(output, input, "line");
    if (pano.WritePTOFile(output, hugin_utils::getPathPrefix(output)))
    {
        std::cout << std::endl << "Written output to " << output << std::endl;
    };
    return 0;
}
