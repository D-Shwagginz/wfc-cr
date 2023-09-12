gcc -c -w -fPIC rsrc/wfc.c -o rsrc/wfc.o
sudo gcc rsrc/wfc.o -shared -o /usr/local/lib/libwfc.so
sudo cp /usr/local/lib/libwfc.so /usr/lib/libwfc.so
sudo ln -s /usr/lib/libwfc.so /lib/libwfc.so