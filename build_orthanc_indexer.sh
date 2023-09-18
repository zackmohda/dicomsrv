set -e
set -x

# https://book.orthanc-server.com/plugins/indexer.html

git clone https://github.com/camicroscope/orthanc-indexer --branch=v0.0

cd orthanc-indexer
mkdir build
cd build

cmake .. -DSTATIC_BUILD=ON -DCMAKE_BUILD_TYPE=Release

# To debug compile errors please add: VERBOSE=1 and it may help to remove -j$(nproc)
make -j$(nproc)

# doesn't work: ./UnitTests

mv libOrthancIndexer.so.mainline ../../libOrthancIndexer.so
cd ../..
rm -rf orthanc-indexer
