#!/bin/bash
workPath=$(dirname $0)
cd $workPath
echo "work path is $workPath"
workPath=$(pwd)
targetProject=$1
echo "change work path to abstract $workPath"
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

cd $projectPath
echo "cd $projectPath"

hugo -D -F server --disableFastRender --bind "0.0.0.0"

