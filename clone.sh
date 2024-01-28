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
  echo "target project is not provided: use clone.sh ***. exit."
  exit 1
fi
targetProject="$1"
projectPath="$workPath/$targetProject"

if [ -d "$projectPath" ];then
  echo "$targetProject ($projectPath) exist"
  exit 1
fi

echo "Begin to clone git@github.com:skyao/$targetProject.git"
git clone git@github.com:skyao/$targetProject.git
if [ $? -ne 0 ]; then
    echo "Fail to clone project $targetProject, exit"
    exit 1
fi

sh "$workPath/addremote.sh" $1
if [ $? -ne 0 ]; then
    echo "Fail to add remote for project $targetProject, exit"
    exit 1
fi

echo "Done"
