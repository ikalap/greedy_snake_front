#!/usr/bin/env sh

echo '现在开始运行vue项目，并且将输出'

set -x
npm run dev &
sleep 1
echo $! > .pidfile
set +x

echo '现在可以打开http://60.204.169.227:5173/ 接口来访问了'
