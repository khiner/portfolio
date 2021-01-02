#!/bin/bash
npm run build
tar -czf build.tar.gz build
ssh -p 7822 root@64.4.160.10 "cd /var/www/html && rm -rf *"
scp -P 7822 build.tar.gz root@64.4.160.10:/var/www/html/
ssh -p 7822 root@64.4.160.10 "cd /var/www/html && tar -xvzf build.tar.gz && rsync -a build/ ./ && rm -r build/ build.tar.gz"
rm build.tar.gz
