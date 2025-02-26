#!/bin/bash
echo running
docker login -u akash3020  -p dckr_pat_DjcHSBpOzXX4cBcNRBwHBN25f_4

if [[ $GIT_BRANCH == "origin/dev" ]]; then
 echo "running build"
       sh 'chmod +x build.sh'
       sh './build.sh'

        docker tag test akash3020/dev
        docker push akash3020/dev

if [[ $GIT_BRANCH == "origin/master" ]]; then
        sh 'chmod +x build.sh'
        sh './build.sh'

        docker tag test akash3020/prod
        docker push akash3020/prod

else
        echo "failed"
fi  
