BOOST=boost
HTSLIB=htslib
SEQAN=seqan

CXXFLAGS+=-I.
CXXFLAGS+=-isystem $(SEQAN)/include
CXXFLAGS+=-I$(HTSLIB)/include
CXXFLAGS+=-isystem $(BOOST)/include
CXXFLAGS+=-pthread 
CXXFLAGS+=-Wfatal-errors

LDFLAGS=-g -L$(HTSLIB)/lib -Wl,-rpath,$(HTSLIB)/lib -lz -lhts -L$(BOOST)/lib -Wl,-rpath,$(BOOST)/lib -lboost_iostreams

# RELEASE build
CXXFLAGS+=-O3 -DSEQAN_ENABLE_TESTING=0 -DSEQAN_ENABLE_DEBUG=0 -DSEQAN_HAS_ZLIB=1

#Debug build
#CXXFLAGS+=-O0 -DSEQAN_ENABLE_TESTING=0 -DSEQAN_ENABLE_DEBUG=1 -DSEQAN_HAS_ZLIB=1

# set std to c++0x to allow using 'auto' etc.
CXXFLAGS+=-std=c++0x

all: read_haps