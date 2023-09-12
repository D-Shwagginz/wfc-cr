gcc -c -w -fPIC lib/wfc-cr/rsrc/wfc.c -o lib/wfc-cr/rsrc/wfc.o
sudo gcc lib/wfc-cr/rsrc/wfc.o -shared -o /usr/local/lib/LibWFC.so -lm
sudo cp /usr/local/lib/LibWFC.so /usr/lib/LibWFC.so
sudo ln -s /usr/lib/LibWFC.so /lib/LibWFC.so