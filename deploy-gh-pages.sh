#!/bin/bash
rm -rf out || exit 0;
mkdir out;
echo "Starting to deploy..."
( cd out
 git init
 git config user.name "${GIT_NAME}"
 git config user.email "${GIT_EMAIL}"

 mkdir dist
 cp -r ../dist/* ./dist/

 mkdir img
 cp -r ../img/* ./img/

 cp ../index.html ./index.html
 cp ../service-worker-registration.js ./service-worker-registration.js
 cp ../service-worker.js ./service-worker.js
 cp ../CNAME ./CNAME

 git add .
 git commit -a -m "Deployed to Github Pages"
 git push --force "https://${GH_TOKEN}@${GH_REF}" master:gh-pages
)
echo "Deployed."
