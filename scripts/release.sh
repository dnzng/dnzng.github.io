#!/bin/sh

# build
npm run build
git add -A
git commit -m '[build]'

# push
git push origin master
