#!/bin/bash

source tools/config.sh

echo "Start building..."

cd base
docker build -t ${PREFIX}nodejs:$VERSION --build-arg node_version=8.1.3  .
docker push ${PREFIX}nodejs:$VERSION
cd ..

list=( \
    "analysis-nodejs-eslint" \
    "analysis-nodejs-flow" \
    "analysis-nodejs-jscs" \
    "analysis-nodejs-jshint" \
    "build-nodejs-babel" \
    "build-nodejs-browserify" \
    "build-nodejs-brunch" \
    "build-nodejs-coffee" \
    "build-nodejs-grunt" \
    "build-nodejs-gulp" \
    "build-nodejs-less" \
    "build-nodejs-uglify" \
    "build-nodejs-webpack" \
    "dependence-nodejs-bower" \
    "dependence-nodejs-npm" \
    "dependence-nodejs-yarn" \
    "document-nodejs-docco" \
    "document-nodejs-jsdoc" \
)

paths=( \
    "cd docker/analysis/eslint" \
    "cd ../flow" \
    "cd ../jscs" \
    "cd ../jshint" \
    "cd ../../build/babel" \
    "cd ../browserify" \
    "cd ../brunch" \
    "cd ../coffee" \
    "cd ../grunt" \
    "cd ../gulp" \
    "cd ../less" \
    "cd ../uglify" \
    "cd ../webpack" \
    "cd ../../dependence/bower" \
    "cd ../npm" \
    "cd ../yarn" \
    "cd ../../document/docco" \
    "cd ../jsdoc" \
)

for i in {0..17}; do
    ${paths[$i]}
    echo "Build $PREFIX${list[$i]}:$VERSION"
    docker build -t $PREFIX${list[$i]}:$VERSION .
    docker push $PREFIX${list[$i]}:$VERSION
done

echo "Build finished."
