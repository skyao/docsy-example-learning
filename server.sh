#!/bin/bash
targetProject=$1

if [ -z "$targetProject" ];then
  echo "target project is not provided: use build-leaning.sh ***. exit."
  exit 1
fi
targetProject="learning-$1"
projectPath="/Users/sky/work/code/learning2/$targetProject"

if [ ! -d "$projectPath" ];then
  echo "$targetProject ($projectPath) not found, exit"
  exit 1
fi

# init project if need 
sh ./init.sh $1
if [ $? -ne 0 ]; then
    echo "Fail to init project $targetProject, exit"
    exit 1
fi

cd $projectPath
echo "cd $projectPath"

hugo2 -D -F server --disableFastRender --bind "0.0.0.0"

