#!/bin/bash
pushd ~/heffree/
git pull && git add -A && git commit -m 'update' && git push
popd