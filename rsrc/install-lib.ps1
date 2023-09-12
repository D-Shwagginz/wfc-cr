$ErrorActionPreference= 'silentlycontinue'
cl /c lib\wfc\rsrc\wfc.c
lib wfc.obj
mkdir libs
copy wfc.lib libs\wfc.lib
del wfc.obj
del wfc.lib