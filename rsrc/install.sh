gcc -c -w -fPIC rsrc/wfc.c -o rsrc/wfc.o
sudo gcc rsrc/wfc.o -shared -o /usr/local/lib/LibWFC.so
sudo cp /usr/local/lib/LibWFC.so /usr/lib/LibWFC.so
# sudo ln -s /usr/lib/LibWFC.so /lib/LibWFC.so