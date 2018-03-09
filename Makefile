# Tutorial em https://forum.nasm.us/index.php?topic=1268.0

#PATH := /cygdrive/c/Program Files (x86)/Microsoft Visual Studio 11.0/VC/BIN/amd64:${PATH}
VCINCLUDE = "c:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\INCLUDE"
#VCLIBPATH = "c:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\LIB\amd64"
SDKINCLUDE = "C:\Program Files (x86)\Windows Kits\10\Include\10.0.16299.0\um"
SDKSHAREDINCLUDE = "C:\Program Files (x86)\Windows Kits\10\Include\10.0.16299.0\shared"
SDKLIBPATH = "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.16299.0\um\x64"

CC = cl.exe
COPTS = /nologo /TC /favor:INTEL64 /MT /GA /GR- /Ox /w /Y- /I ${SDKINCLUDE} /I ${SDKSHAREDINCLUDE}

LD = link.exe
LDOPTS = /nologo /MACHINE:X64 /OPT:REF /OPT:ICF /nodefaultlib /SUBSYSTEM:WINDOWS
LDOBJS = /LIBPATH:${SDKLIBPATH} kernel32.lib user32.lib

ASM = /cygdrive/c/nasm/nasm.exe
ASMOPTS = -f win64 -Ox

clean:
	rm *.obj

main64.obj: main64.asm
	nasm -f win64 -l main64.obj main64.asm

main64.exe: main64.obj
	gcc -o bin/main64.exe main64.obj

all: main64.exe clean
	