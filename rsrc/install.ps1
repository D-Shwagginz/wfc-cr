cl /c rsrc\wfc.c
lib wfc.obj
copy wfc.lib C:\wfc\wfc.lib
del wfc.obj
del wfc.lib