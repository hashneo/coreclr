#!/bin/bash

pushd `dirname $0` > /dev/null
SCRIPT_PATH=`pwd -P`
popd > /dev/null

OUTPUT_PATH=$SCRIPT_PATH/output

if [ ! -d "$OUTPUT_PATH" ]; then
  mkdir -p $OUTPUT_PATH
fi

docker build --no-cache=true -t dotnet/coreclr . && 
docker run -ti -v $OUTPUT_PATH:/root/git/coreclr/bin/Product/  dotnet/coreclr /root/git/coreclr/build.sh $1
