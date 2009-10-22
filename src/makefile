##
## PIN tools
##

export PIN_HOME=/home/sven/build/pin-2.7-29972-gcc.3.4.6-ia32_intel64-linux
#export PIN_HOME=/home/svens/build/pin-linux
export PIN_KIT=${PIN_HOME}

##############################################################
#
# Here are some things you might want to configure
#
##############################################################

TARGET_COMPILER?=gnu
ifdef OS
    ifeq (${OS},Windows_NT)
        TARGET_COMPILER=ms
    endif
endif

##############################################################
#
# include *.config files
#
##############################################################

ifeq ($(TARGET_COMPILER),gnu)
    include $(PIN_KIT)/source/tools/makefile.gnu.config
    CXXFLAGS ?= -I$(PIN_HOME)/InstLib -Wall -Werror -Wno-unknown-pragmas $(DBG) $(OPT) -MMD
endif

ifeq ($(TARGET_COMPILER),ms)
    include ../makefile.ms.config
    DBG?=
endif

##############################################################
#
# build rules
#
##############################################################

EXTRA_LIBS = -lsqlite3

TOOL_ROOTS = vapp
EXTRA_OBJS= $(OBJDIR)callbacks.o $(OBJDIR)database.o 

CXXFLAGS+= -I../libVAPPControl

all: tools
SANITY_TOOLS = 

TOOLS = $(TOOL_ROOTS:%=$(OBJDIR)%$(PINTOOL_SUFFIX))
TESTS = $(TOOL_ROOTS:%=%.test)

ifeq ($(TARGET_OS),l)
	TESTS += memtracemt.test 
endif

tools: $(OBJDIR) $(TOOLS)
test: $(OBJDIR) $(TESTS)
tests-sanity: $(OBJDIR) $(SANITY_TOOLS:%=%.test)

## build rules

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(OBJDIR)%.o : %.cpp
	$(CXX) -c $(CXXFLAGS) $(PIN_CXXFLAGS) ${OUTOPT}$@ $<

$(TOOLS): $(PIN_LIBNAMES)
$(TOOLS): %$(PINTOOL_SUFFIX) : %.o $(EXTRA_OBJS)
	${PIN_LD} $(PIN_LDFLAGS) $(LINK_DEBUG) ${LINK_OUT}$@ $< $(EXTRA_OBJS) ${PIN_LPATHS} $(PIN_LIBS) $(EXTRA_LIBS) $(DBG) 

Part1.test : $(OBJDIR)vapp$(PINTOOL_SUFFIX) vapp.tested vapp.failed $(OBJDIR)thread
	touch $*.makefile.copy; rm $*.makefile.copy
	$(PIN) -t $< -emit 0 -- $(OBJDIR)thread
	rm vapp.failed


## cleaning
clean:
	-rm -rf $(OBJDIR) *.out *.out.* *.tested *.failed *.vapp



$(OBJDIR)thread: thread.c ../threadlib/threadlib_unix.c ../threadlib/threadlib.h
	$(CC) $(APP_CXXFLAGS) -o $(OBJDIR)thread thread.c ../threadlib/threadlib_unix.c $(APP_PTHREAD)

%.test : $(OBJDIR)%$(PINTOOL_SUFFIX) %.tested %.failed
	touch $*.makefile.copy; rm $*.makefile.copy
	$(PIN) -t $< -emit 0 -- $(TESTAPP) makefile $*.makefile.copy
	$(PIN_CMP) makefile $*.makefile.copy
	rm $*.makefile.copy; rm $*.failed

-include *.d
