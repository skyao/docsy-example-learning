#!/bin/bash
workPath=$(dirname $(readlink -f $0))
targetProject=$1
echo "cd $workPath"
cd $workPath

if [ -z "$targetProject" ];then
  echo "target project is not provided: use build-leaning.sh ***. exit."
  exit 1
fi
targetProject="learning-$1"
projectPath="$workPath/$targetProject"

if [ ! -d "$projectPath" ];then
  echo "$targetProject ($projectPath) not found, exit"
  exit 1
fi

# init project if need 
sh $workPath/init.sh $1
if [ $? -ne 0 ]; then
    echo "Fail to init project $targetProject, exit"
    exit 1
fi

cd $projectPath
echo "cd $projectPath"

hugo -D -F server --disableFastRender --bind "0.0.0.0"

