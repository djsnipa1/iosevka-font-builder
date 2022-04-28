#!/bin/bash

echo "installing deps"
sudo apt install -y nodejs npm ttfautohint libttfautohint-dev

echo "installing premake"
cd /workspace/iosevka-font-builder || exit

git clone https://github.com/premake/premake-core
cd premake-core || exit
make -f Bootstrap.mak linux

echo "installing otfcc"
cd /workspace/iosevka-font-builder || exit

git clone https://github.com/caryll/otfcc
cd otfcc || exit
../premake-core/bin/release/premake5 gmake
cd build/gmake || exit
make config > release_x64

echo "cloning iosevka repo"
cd /workspace/iosevka-font-builder || exit

git clone --depth=1 https://github.com/be5invis/Iosevka iosevka

cd iosevka || exit
npm install

