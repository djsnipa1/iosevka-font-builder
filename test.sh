#!/bin/bash

read -p "install deps (y/n)?" choice
case "$choice" in 
  y|Y ) echo "yes";;
  n|N ) echo "no";;
  * ) echo "invalid";;
esac

sudo apt update
sudo apt install -y nodejs npm ttfautohint libttfautohint-dev
echo ".:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:"

read -p "install premake (y/n)?" choice
case "$choice" in 
  y|Y ) echo "yes";;
  n|N ) echo "no";;
  * ) echo "invalid";;
esac

cd /workspace/iosevka-font-builder || exit

git clone https://github.com/premake/premake-core
cd premake-core || exit
make -f Bootstrap.mak linux
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="

read -p "install otfcc (y/n)?" choice
case "$choice" in 
  y|Y ) echo "yes";;
  n|N ) echo "no";;
  * ) echo "invalid";;
esac

cd /workspace/iosevka-font-builder || exit

git clone https://github.com/caryll/otfcc
cd otfcc || exit
../premake-core/bin/release/premake5 gmake
cd build/gmake || exit
make config > release_x64
echo ".:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:"

read -p "clone Iosevka repo (y/n)?" choice
case "$choice" in 
  y|Y ) echo "yes";;
  n|N ) echo "no";;
  * ) echo "invalid";;
esac

cd /workspace/iosevka-font-builder || exit

git clone --depth=1 https://github.com/be5invis/Iosevka iosevka
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="

read -p "iosevka repo npm install (y/n)?" choice
case "$choice" in 
  y|Y ) echo "yes";;
  n|N ) echo "no";;
  * ) echo "invalid";;
esac

cd iosevka || exit
npm install
echo ".:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:"
echo ""
cat << EndOfMessage
 _____ _   _ ____  
| ____| \ | |  _ \ 
|  _| |  \| | | | |
| |___| |\  | |_| |
|_____|_| \_|____/ 
EndOfMessage
