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

cd $projectPath

git remote add docsy git://github.com/skyao/docsy-example.git
git fetch --all



