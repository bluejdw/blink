## README:
##
## Add definitions that trigger new functions here, 
## before including defs.mk

## Avoid editing below

SHELL := /bin/bash
SRC := ./src
CEXT := .c
OBJDIR :=
OBJEXT := .o
OBJDIR := obj

ifeq ($(LINKSPEC),)
   LINKSPEC := $(MKPATH)startup/vorago_va416x0.ld
endif


ARFLAGS :=
ASFLAGS := -mcpu=cortex-m4 -c -gdwarf-4 -defsym=__EVAL=1

# Default REB1 frequency. Change to other frequency if desired
CFLAGS := -std=c99 -mcpu=cortex-m4 -funsigned-char -fshort-enums  -D__EVAL -gdwarf-4 -O0 -ffunction-sections -Wno-packed -Wno-missing-prototypes -Wno-missing-noreturn -Wno-sign-conversion  -Wno-unused-macros   -DVA416xx
CXXFLAGS := $(CFLAGS)
LDFLAGS :=  -lc  --specs=nosys.specs


TARGET_FUNCTIONS := -DDUMMY

ifeq ($(RELEASE),1)
else
    CFLAGS += -g
    CXXFLAGS += -g
endif


## setup toolchain
TOOLPATH ?= /opt/armgnu/bin

AR := $(TOOLPATH)/arm-none-eabi-ar r $(ARFLAGS)
AS := $(TOOLPATH)/arm-none-eabi-as $(ASFLAGS)
CC := $(TOOLPATH)/arm-none-eabi-gcc $(CFLAGS)
CPP := $(TOOLPATH)/arm-none-eabi-cpp $(CFLAGS)
CXXPP := $(TOOLPATH)/arm-none-eabi-cpp $(CXXFLAGS)
CXX := $(TOOLPATH)/arm-none-eabi-g++ $(CXXFLAGS)
LD := $(TOOLPATH)/arm-none-eabi-ld $(LDFLAGS)
OBJCOPY := $(TOOLPATH)/arm-none-eabi-objcopy
OBJDUMP := $(TOOLPATH)/arm-none-eabi-objdump


INC  := -I./hdr $(foreach d, $(INCDIRS), -I$(MKPATH)$d/hdr)

