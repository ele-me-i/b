#!/bin/bash

curl -s -L https://github.com/jgm/pandoc/releases/download/2.16.2/pandoc-2.16.2-linux-amd64.tar.gz | tar xvzf - -C ./
# npm i -g hexo-cli gulp gulp-uglify
# npm i
export PATH="$(pwd)/pandoc-2.16.2/bin:$PATH"
hexo generate && gulp build