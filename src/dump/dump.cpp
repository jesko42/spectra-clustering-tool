//! \verbatim
//! ###########################################################################
//! # SDSS sorting prototype - Stage I
//! #
//! # Copyright (c) 2009 Aick in der Au
//! # All rights reserved.
//! ###########################################################################
//!
//!      created by : Aick in der Au <aick.inderau@gmail.com>
//!      created on : 1/19/2009
//! additional docs : none
//!  responsibility : 1. Aick in der Au
//!                   2. 
//! \endverbatim
//!
//! \file  dump.cpp
//! \brief program to generate binary dumps from a directory of FITS files.


#include <Windows.h>
#include <conio.h>

#include "tclap/CmdLine.h"

#include "sdsslib/spectraVFS.h"
#include "sdsslib/spectra.h"
#include "sdsslib/helpers.h"
#include "sdsslib/filehelpers.h"
#include "sdsslib/sdssSoftwareVersion.h"


typedef char _TCHAR;

#define DATADIR std::string("/data/*")
//#define DATADIR std::string("G:/SDSS_ANALYZE/fits/spectro/data/*")
#define DUMPFILE std::string("allSpectra.bin")
 


void main(int argc, char* argv[])
{
	std::ofstream logFile("dump_log.txt");

	Helpers::print("Welcome to SDSS Dump!\n\n\n", &logFile);
	Helpers::print("Reads SDSS fits files from a given directory (and subdirectories) and dumps the data to a binary file.\n", &logFile);
	Helpers::print("Reads binary dump files and extracts text tables out of it.\n\n", &logFile);

	std::string sstrDataDir = FileHelpers::getCurrentDirectory()+DATADIR;
	std::string sstrDumpFile = DUMPFILE;
	unsigned int spectraFilter = 0x0fffff;//SPT_DEFAULTFILTER;
	std::string sstrInputDumpFile("");


	try {  

		std::string sstrExamples("examples:\n");
		sstrExamples += std::string("dump.exe -d F:/SDSS_ANALYZE/fits/spectro/data/* -o allSpectra.bin -f 25\n");
		sstrExamples += std::string("dump.exe -i sofmnet.bin\n");


		TCLAP::CmdLine cmd(sstrExamples, ' ', SDSSVERSIONSTRING);

		std::string sstrFilterDesc = std::string("where <filter> is any added combination of:\n");
		sstrFilterDesc +=  std::string( "  SPEC_UNKNOWN =   1\n");
		sstrFilterDesc +=  std::string( "  SPEC_STAR    =   2\n");
		sstrFilterDesc +=  std::string( "  SPEC_GALAXY  =   4\n");
		sstrFilterDesc +=  std::string( "  SPEC_QSO     =   8\n");
		sstrFilterDesc +=  std::string( "  SPEC_HIZ_QSO =  16\n");
		sstrFilterDesc +=  std::string( "  SPEC_SKY     =  32\n");
		sstrFilterDesc +=  std::string( "  STAR_LATE    =  64\n");
		sstrFilterDesc +=  std::string( "  GAL_EM       = 128\n\n\n");

		TCLAP::ValueArg<std::string> dataDirArg("d", "datadir", "example: F:/SDSS_ANALYZE/fits/spectro/data/*", false, sstrDataDir, "datadir/*");
		TCLAP::ValueArg<std::string> outputFilenameArg("o", "outputdumpfile", "example: allSpectra.bin", false, sstrDumpFile, "outputfilename.bin");
		TCLAP::ValueArg<unsigned int> filterArg("f", "filter", sstrFilterDesc, false, spectraFilter, "Dump only FITS files with the given filter type.");
		TCLAP::ValueArg<std::string> inputFilenameArg("i", "inputdumpfile", "example: sofmnet.bin. If inputdumpfile is specified, then all other arguments are ignored.", false, sstrInputDumpFile, "dumpfile for reverse reads, then other parameters are ignored.");

		cmd.add( dataDirArg );
		cmd.add( outputFilenameArg );
		cmd.add( filterArg );
		cmd.add( inputFilenameArg );

		cmd.parse( argc, argv );

		sstrDataDir = dataDirArg.getValue();
		sstrDumpFile = outputFilenameArg.getValue();
		spectraFilter = filterArg.getValue();
		sstrInputDumpFile = inputFilenameArg.getValue();
	}
	catch (TCLAP::ArgException &e)  
	{ 
		Helpers::print( "error: "+e.error()+" for argument "+e.argId()+"\n", &logFile );
	}


	bool bReverseRead = !sstrInputDumpFile.empty();

	if ( !bReverseRead )
	{
		Helpers::print( "Creating binary dump with following parameters:\n", &logFile);
		Helpers::print( "datadir: "+sstrDataDir+"\n", &logFile );
		Helpers::print( "dumpfile: "+sstrDumpFile+"\n", &logFile );
		Helpers::print( "filter: "+Spectra::spectraFilterToString(spectraFilter)+"\n", &logFile );
		Helpers::print( "each spectrum contains" + Helpers::numberToString<size_t>(sizeof(Spectra)) + "bytes.\n\n", &logFile );
		
		Helpers::print( "starting dump...\n", &logFile );
		size_t writtenSpectra = SpectraVFS::write( sstrDataDir, sstrDumpFile, spectraFilter, &logFile );
		Helpers::print( "...finished writing "+ Helpers::numberToString<size_t>(writtenSpectra) +" spectra.\n", &logFile );
	}
	else
	{
		Helpers::print( "Filename extraction from dumpfile with following parameters:\n", &logFile);
		Helpers::print( "dumpfile: "+sstrDumpFile+"\n", &logFile );

		SpectraVFS vfs(sstrDumpFile, true);

		std::string sstrOutFileName(FileHelpers::getFileNameMinusExtension(sstrDumpFile));
		sstrOutFileName += ".txt";

		std::ofstream fon(sstrOutFileName.c_str());


		size_t numSpectra( vfs.getNumSpectra() );
		for (size_t i=0;i<numSpectra;i++)
		{
			Spectra *a = vfs.beginRead(i);
			fon << a->getFileName() + std::string("\n");			
			vfs.endRead(i);
		}
	}


}

