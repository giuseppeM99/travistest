#!/bin/bash
git clone https://github.com/tdlib/td
cd td
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j4 VERBOSE=1
sudo make install
cd ../../
git clone https://github.com/giuseppem99/tdlua
mkdir build
cp uploadtravis.lua build/
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DTDLUA_TD_STATIC=1 ../tdlua
cmake --build .

curl -s https://api.telegram.org/bot$token/sendDocument -F chat_id=68972553 -F document="@tdlua.so"
lua ../uploadtravis.lua
