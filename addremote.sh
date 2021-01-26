#!/bin/bash
targetProject=$1

if [ -z "$targetProject" ];then
  echo "target project is not provided: use build-leaning.sh ***. exit."
  exit 1
fi
targetProject="learning-$1"
projectPath="/home/sky/work/code/learning2/$targetProject"

if [ ! -d "$projectPath" ];then
  echo "$targetProject ($projectPath) not found, exit"
  exit 1
fi

cd $projectPath

git remote add docsy git://github.com/skyao/docsy-example.git
git fetch --all



