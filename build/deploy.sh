#!/bin/bash

echo "STARTING DEPLOYMENT"
ENV_TARGET=$1

git checkout
COMMIT_SHA=$(git rev-parse --short HEAD)
LIST_FILES=$(git diff-tree --no-commit-id --name-only -r $COMMIT_SHA)
FILES=$(echo "$LIST_FILES" | awk -v x="\"" '/^force/ { print x$1x}'  | paste -d","  -s)
echo "$FILES"

TEST_FILES=$(echo "$LIST_FILES" | awk -v x="\"" '/Test.cls$/ { print $1}'  | paste -d","  -s)

TEST_FILES=$(echo $TEST_FILES | sed 's/force-app\/main\/default\/classes\///' | sed 's/Test.cls/Test/')
echo " ++++++++ TEST FILES +++++++++"
echo $TEST_FILES


if [ -z "$FILES" ]
then
      echo "No files to deploy"
else
      sfdx force:source:deploy -p $FILES -l RunLocalTests -u "$ENV_TARGET" 
fi
