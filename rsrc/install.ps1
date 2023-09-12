cl /c rsrc\wfc.c
lib wfc.obj
mkdir C:\wfc
copy wfc.lib C:\wfc\wfc.lib
del wfc.obj
del wfc.lib