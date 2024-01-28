#!/bin/bash
echo "Begin to merge learning-clean-2024 branch of docsy-example-learning repo"
workPath=$(dirname $0)
cd $workPath
echo "work path is $workPath"
workPath=$(pwd)
targetProject=$1
echo "change work path to abstract $workPath"
echo "cd $workPath"
cd $workPath

if [ -z "$targetProject" ];then
  echo "target project is not provided: use merge.sh ***. exit."
  exit 1
fi
targetProject="$1"
projectPath="$workPath/$targetProject"

if [ ! -d "$projectPath" ];then
  echo "$targetProject ($projectPath) not found, exit"
  exit 1
fi

cd $projectPath

echo "Begin to update local repo by 'git pull'..."
git pull
if [ $? -ne 0 ]; then
    echo "Fail to pull project $targetProject, exit"
    exit 1
fi
echo "Success to do 'git pull'"

echo "Begin to fetch remote repo by 'git fetch upstream'..."
git fetch upstream
if [ $? -ne 0 ]; then
    echo "Fail to fetch git remote upstream, exit"
    exit 1
fi
echo "success to do 'git fetch upstream'"

echo "Begin to merge remote repo by 'git merge upstream/learning-clean-2024'..."
git merge upstream/learning-clean-2024
if [ $? -ne 0 ]; then
    echo "Fail to merge learning-clean-2024 branch to project $targetProject, exit"
    exit 1
fi
echo "Success to do 'git merge docsy/learning-clean-2024'"


echo "Begin to push project by 'git push'..."
git push
if [ $? -ne 0 ]; then
    echo "Fail to push project $targetProject after, exit"
    exit 1
fi
echo "Success to do 'git push'"

echo "Success to merge learning-clean-2024 branch"
