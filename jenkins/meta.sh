#!/bin/bash

# - handles running u1604.sh, tee'ing to a log file, and uploading this logfile to s3
# - assumes it runs from root of cloend coriander repo

set -e
set -x
set -o pipefail

PROJECT=coriander

if [ -z "${BUILD_NUMBER}" ]; then {
    BUILD_NUMBER=test
} fi

# if [ -z "${GIT_COMMIT_SHORT}" ]; then {
GIT_COMMIT_SHORT=$(git log --oneline -n 1 | awk '{print $1}')
# } fi

function update_project_index {
    echo '<html><body>' > newhtml.html
    for filename in $(aws s3 ls s3://hughperkins-ci/${PROJECT}/ | grep PRE | awk '{print $2}' | cut -d \. -f 1); do {
        echo "<a href=\"https://s3.amazonaws.com/hughperkins-ci/${PROJECT}/${filename}.d/index.html\">${filename}</a><br />" >> newhtml.html
    } done
    echo '</body></html>' >> newhtml.html
    aws s3 cp newhtml.html s3://hughperkins-ci/${PROJECT}/index.html
}

function upload_artifacts {
    echo '<html><body>' > newhtml.html

    for artifact in $1; do {
        if [[ -f ${artifact} ]]; then {
            aws s3 cp ${artifact} s3://hughperkins-ci/${PROJECT}/${BUILD_NUMBER}-${GIT_COMMIT_SHORT}.d/${BUILD_NUMBER}-${GIT_COMMIT_SHORT}-${artifact}
            echo "<a href=\"https://s3.amazonaws.com/hughperkins-ci/${PROJECT}/${BUILD_NUMBER}-${GIT_COMMIT_SHORT}.d/${BUILD_NUMBER}-${GIT_COMMIT_SHORT}-${artifact}\">${BUILD_NUMBER}-${GIT_COMMIT_SHORT}-${artifact}</a><br />" >> newhtml.html
        } fi
    } done

    echo '</body></html>' >> newhtml.html
    aws s3 cp newhtml.html s3://hughperkins-ci/${PROJECT}/${BUILD_NUMBER}-${GIT_COMMIT_SHORT}.d/index.html
}

function set_status {
    status_string=$1
    description="$2"

    BUILD_URL="https://s3.amazonaws.com/hughperkins-ci/${PROJECT}/${BUILD_NUMBER}-${GIT_COMMIT_SHORT}.d/index.html"
    target_url_str="\"target_url\": \"${BUILD_URL}\","
    if [[ ${status_string} == pending ]]; then {
        target_url_str=
    } fi
    (
        set +x
        curl -XPOST -H "Authorization: token ${OAUTH_TOKEN}" https://api.github.com/repos/hughperkins/${PROJECT}/statuses/$(git rev-parse HEAD) -d "{
          \"state\": \"${status_string}\",
          ${target_url_str}
          \"description\": \"${description}\"
        }"
    )
}

function error {
    upload_artifacts build.log
    update_project_index
    set_status failure "Build or tests failed"
    exit 1
}

set_status pending Building

# bash jenkins/u1604.sh 2>&1 | tee build.log || error
python2 jenkins/u1604.py 2>&1 | tee build.log || error

upload_artifacts 'build.log artifacts.zip'
update_project_index
set_status success "Build and tests completed successfully"
