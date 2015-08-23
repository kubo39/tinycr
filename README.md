# tinycr

```
curl "http://crystal-lang.s3.amazonaws.com/pcl/libpcl-1.12-1-linux-x86_64.tar.gz" | tar xz -C /tmp
git clone git://github.com/ivmai/libatomic_ops.git
git clone git://github.com/ivmai/bdwgc.git
ln -s `pwd`/libatomic_ops `pwd`/bdwgc/libatomic_ops
cd bdwgc
autoreconf -vif
automake --add-missing
./configure
make
cd ..
export LIBRARY_PATH=/tmp/libpcl-1.12-1/lib:./bdwgc/.libs
crystal build hello.cr --release --emit obj
gcc hello.o -o hello -s -l:libpcre.a -l:libgc.a -l:libevent.a -l:libpcl.a -lpthread -lunwind
wc -c < hello
```
