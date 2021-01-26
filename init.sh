#!/bin/bash
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

if [ -d "node_modules" ];then
  echo 'Find directoy "node_modules"'
else
  echo 'Directoy "node_modules" not found, create soft link'
  ln -s ../node_modules .
fi

if [ ! -d "themes" ];then
  echo "No themes directory, create it"
  mkdir themes
fi

if [ -d "themes/docsy" ];then
  echo 'Find directoy "themes/docsy"'
else
  echo 'Directoy "themes/docsy" not found, create soft link'
  cd themes
  ln -s ../../docsy .
fi



