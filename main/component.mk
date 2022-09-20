## Definitions for how to collect and compile kinds of files.
## It defines the method to compile .c, .s, .S, and .cpp
##
## Assumptions:
##
##  ALL SOURCE in a particular directory is inside the 'src' directory.
##  ALL HEADERS in a particular directory is inside the 'hdr' directory.
##
##  If a directory contains sub-projects, then use the boiler-plate makefile (see ./vorago/Makefile for example).
##  If a directory contains a leaf (has no sub-projects), then use the boiler-plate makefile (see ./app/Makefile for example).
##
##  In 'leaf' projects, the definition of INCDIR does NOT include the '/hdr' suffix. No need. Since all include
##  directories are 'hdr' all that is required is the parent directory.
##
##
##  Example 'leaf' project -- a project that is stand-alone and has a 'src' and 'hdr' directory scheme:
#
# # 1. define the depth
# MKPATH = ../
# 
# # 2. add the parent directories of ANY projects that have header files (hdr) that *this* leaf project needs.
# INCDIRS = . startup vorago/drivers/hal vorago/mcu vorago/BSP/evk vorago/utils
#
# # 3. now, calculate the definitions...
# include $(MKPATH)/component.mk
#
##


include $(MKPATH)/defs.mk

# find all the .c
CSRC := $(shell find $(SRC) -type f -name *.c)
COBJ := $(patsubst $(SRC)/%,$(OBJDIR)/%, $(CSRC:.c=.o))

# find all the .cpp
CXXSRC := $(shell find $(SRC) -type f -name *.cpp)
CXXOBJ := $(patsubst $(SRC)/%,$(OBJDIR)/%, $(CXXSRC:.cpp=.o))

# find all the .s
SSRC := $(shell find $(SRC) -type f -name *.s)
SOBJ := $(patsubst $(SRC)/%,$(OBJDIR)/%, $(SSRC:.s=.o))

# find all the .S
PSSRC := $(shell find $(SRC) -type f -name *.S)
PSOBJ := $(patsubst $(SRC)/%,$(OBJDIR)/%, $(PSSRC:.S=.o))

# don't edit
TARGET := dummy.a
TARGETDIR := bin
DEPDIR := .deps
CDEPS := $(CSRC:%.c=$(DEPDIR)/%.d)
CXXDEPS := $(CXXSRC:%.cpp=$(DEPDIR)/%.d)

# rule for make depend (for .c)
MAKEDEPEND.c = $(CPP) $(INC) $(CFLAGS) -MT $@ -M -MP -MF $(DEPDIR)/$(SRC)/$*.Td $< \
	| sed -n 's,^\# *[0-9][0-9]* *"\([^"<]*\)".*,$@: \1\n\1:,p' \
	| sort -u > $(DEPDIR)/$(SRC)/$*.d

# rule for make depend (for .cpp)
MAKEDEPEND.cpp = $(CXXPP) $(INC)  $(CPPFLAGS) -MT $@ -M -MP -MF $(DEPDIR)/$(SRC)/$*.Td $< \
	| sed -n 's,^\# *[0-9][0-9]* *"\([^"<]*\)".*,$@: \1\n\1:,p' \
	| sort -u > $(DEPDIR)/$(SRC)/$*.d


# Building *this* target (whatever it is).
# Result is a set of .o that are linked by the top level Makefile
$(TARGET) : $(COBJ) $(SOBJ) $(PSOBJ) $(CXXOBJ)
	@mkdir -p $(TARGETDIR)
	@cp obj/*.o bin

#####################################################################
##
## Specific Rules
##
## Assembly
##
## Not pre-compiled assembly.  Just plain old ASM
$(OBJDIR)/%.o : $(SRC)/%.s
	@echo "	AS	" $<
	@mkdir -p $(dir $@)
	@mkdir -p $(DEPDIR)/$(SRC)
	@$(AS) $(INC) -c -o $@ $<

## Pre-compiler Assembly  (assembly that has .S extension that is precompiled)
$(OBJDIR)/%.o : $(SRC)/%.S
	@echo "	AS	" $<
	@mkdir -p $(dir $@)
	@mkdir -p $(DEPDIR)/$(SRC)
	@$(CC) $(INC) -c -o $@ $<

## C Source
$(OBJDIR)/%.o : $(SRC)/%.c
	@echo "	CC	" $<
	@mkdir -p $(dir $@)
	@mkdir -p $(DEPDIR)/$(SRC)
	@$(MAKEDEPEND.c)
	@$(CC) $(INC) -c -o $@ $<
	@mv -f $(DEPDIR)/$(SRC)/$*.Td $(DEPDIR)/$(SRC)/$*.d && touch $@

## C++ Source
$(OBJDIR)/%.o : $(SRC)/%.cpp # removal?
	@echo "	CXX	" $<
	@mkdir -p $(dir $@)
	@$(MAKEDEPEND.cpp)
	@$(CXX) $(INC) -c -o $@ $<
	@mv -f $(DEPDIR)/$(SRC)/$*.Td $(DEPDIR)/$(SRC)/$*.d && touch $@

## If these prerequisites are modified, then rebuild
$(CSRC): Makefile $(MKPATH)component.mk $(MKPATH)/defs.mk
	@touch $@
$(CXXRC): Makefile $(MKPATH)component.mk $(MKPATH)/defs.mk
	@touch $@
$(SSRC): Makefile $(MKPATH)component.mk $(MKPATH)/defs.mk
	@touch $@
$(PSSRC): Makefile $(MKPATH)component.mk $(MKPATH)/defs.mk
	@touch $@

.PRECIOUS = $(DEPDIR)/$(SRC)/%.d
$(DEPDIR)/$(SRC)/%.d: ; 

-include $(CDEPS)
-include $(CXXDEPS)

## Within a leaf-project (no sub-projects), just clean it
clean:
	@rm -rf $(SOBJ) $(PSOBJ) $(COBJ) $(CXXOBJ) $(DEPDIR)
	@rm -rf $(TARGETDIR) $(OBJDIR) 
