#!/bin/bash
echo running
docker login -u akash3020  -p dckr_pat_DjcHSBpOzXX4cBcNRBwHBN25f_4

if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker tag test akash3020/dev
    docker push akash3020/dev

elif [[ $GIT_BRANCH == "origin/main" ]]; then
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker tag test akash3020/prod 
    docker push akash3020/prod
fi
