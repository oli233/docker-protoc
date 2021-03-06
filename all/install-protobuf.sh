#!/bin/bash

# Download binaries directly from maven.

GRPC_VERSION=v1.9.x

git clone -b ${GRPC_VERSION} --recursive https://github.com/grpc/grpc
cd /tmp/grpc
make
make install

cp /tmp/grpc/bins/opt/protobuf/protoc /usr/local/bin/

cd /tmp/grpc/third_party/protobuf
make
make install

cd /tmp
git clone -b $GRPC_VERSION --recursive https://github.com/grpc/grpc-java.git
cd /tmp/grpc-java/compiler
../gradlew java_pluginExecutable
