#!/bin/bash

# - handles running u1604.sh, tee'ing to a log file, and uploading this logfile to s3
# - assumes it runs from root of cloend coriander repo

set -e
set -x

if [ -z "${BUILD_NUMBER}" ]; then {
    BUILD_NUMBER=test
} fi

# if [ -z "${GIT_COMMIT_SHORT}" ]; then {
GIT_COMMIT_SHORT=$(git log --oneline -n 1 | awk '{print $1}')
# } fi

(
set +x

BUILD_URL="https://s3.amazonaws.com/hughperkins-ci/coriander/${BUILD_NUMBER}-${GIT_COMMIT_SHORT}.d/index.html"
curl -XPOST -H "Authorization: token ${OAUTH_TOKEN}" https://api.github.com/repos/hughperkins/coriander/statuses/$(git rev-parse HEAD) -d "{
  \"state\": \"pending\",
  \"description\": \"Building\"
}"
)

bash jenkins/u1604.sh | tee out.log

echo '<html><body>' > newhtml.html

aws s3 cp out.log s3://hughperkins-ci/coriander/${BUILD_NUMBER}-${GIT_COMMIT_SHORT}.d/${BUILD_NUMBER}-${GIT_COMMIT_SHORT}-build.log
echo "<a href=\"https://s3.amazonaws.com/hughperkins-ci/coriander/${BUILD_NUMBER}-${GIT_COMMIT_SHORT}.d/${BUILD_NUMBER}-${GIT_COMMIT_SHORT}-build.log\">${BUILD_NUMBER}-${GIT_COMMIT_SHORT}-build.log</a><br />" >> newhtml.html

aws s3 cp build/artifacts.zip s3://hughperkins-ci/coriander/${BUILD_NUMBER}-${GIT_COMMIT_SHORT}.d/${BUILD_NUMBER}-${GIT_COMMIT_SHORT}-artifacts.zip
echo "<a href=\"https://s3.amazonaws.com/hughperkins-ci/coriander/${BUILD_NUMBER}-${GIT_COMMIT_SHORT}.d/${BUILD_NUMBER}-${GIT_COMMIT_SHORT}-artifacts.zip\">${BUILD_NUMBER}-${GIT_COMMIT_SHORT}-artifacts.zip</a><br />" >> newhtml.html

echo '</body></html>' >> newhtml.html
aws s3 cp newhtml.html s3://hughperkins-ci/coriander/${BUILD_NUMBER}-${GIT_COMMIT_SHORT}.d/index.html

echo '<html><body>' > newhtml.html
for filename in $(aws s3 ls s3://hughperkins-ci/coriander/ | grep PRE | awk '{print $2}' | cut -d \. -f 1); do {
    echo "<a href=\"https://s3.amazonaws.com/hughperkins-ci/coriander/${filename}.d/index.html\">${filename}</a><br />" >> newhtml.html
} done
echo '</body></html>' >> newhtml.html
aws s3 cp newhtml.html s3://hughperkins-ci/coriander/index.html

(
set +x

BUILD_URL="https://s3.amazonaws.com/hughperkins-ci/coriander/${BUILD_NUMBER}-${GIT_COMMIT_SHORT}.d/index.html"
curl -XPOST -H "Authorization: token ${OAUTH_TOKEN}" https://api.github.com/repos/hughperkins/coriander/statuses/$(git rev-parse HEAD) -d "{
  \"state\": \"success\",
  \"target_url\": \"${BUILD_URL}\",
  \"description\": \"Build and tests completed successfully\"
}"
)
