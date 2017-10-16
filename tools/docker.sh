#!/bin/bash

source tools/config.sh

echo "Start building..."

cd base
docker build -t ${PREFIX}nodejs:$VERSION --build-arg node_version=8.1.3  .
docker push ${PREFIX}nodejs:$VERSION
cd ..

list=( \
    "analysis-nodejs-eslint" \
    )

paths=( \
    "cd docker/Analysis/eslint" \
)

for i in {0..11}; do
    ${paths[$i]}
    echo "Build $PREFIX${list[$i]}:$VERSION"
    docker build -t $PREFIX${list[$i]}:$VERSION .
    docker push $PREFIX${list[$i]}:$VERSION
done

echo "Build finished."
