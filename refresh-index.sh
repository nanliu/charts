#!/bin/bash

REPO_DIR="stable";

pushd $REPO_DIR;
for fname in `ls -1d */`; do
    helm package $fname;
done;
popd;

helm repo index $REPO_DIR --url https://mirusresearch.github.io/charts/$REPO_DIR/;

git add $REPO_DIR;

git commit -m "Refresh helm indexes. $1"
