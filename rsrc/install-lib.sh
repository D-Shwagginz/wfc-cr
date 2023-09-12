gcc -c -w -fPIC lib/wfc-cr/rsrc/wfc.c -o lib/wfc-cr/rsrc/wfc.o
sudo gcc lib/wfc-cr/rsrc/wfc.o -shared -o /usr/local/lib/libwfc.so -lm
sudo cp /usr/local/lib/libwfc.so /usr/lib/libwfc.so
# sudo ln -s /usr/lib/libwfc.so /lib/libwfc.so