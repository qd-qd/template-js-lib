#!/usr/bin/env bash

# https://gist.github.com/vncsna/64825d5609c146e80de8b1fd623011ca
set -euo pipefail

# Define the input vars
GITHUB_REPOSITORY=${1?Error: Please pass username/repo, e.g. prb/foundry-template}
GITHUB_REPOSITORY_OWNER=${2?Error: Please pass username, e.g. prb}
GITHUB_REPOSITORY_DESCRIPTION=${3:-""} # If null then replace with empty string

echo "GITHUB_REPOSITORY: $GITHUB_REPOSITORY"
echo "GITHUB_REPOSITORY_OWNER: $GITHUB_REPOSITORY_OWNER"
echo "GITHUB_REPOSITORY_DESCRIPTION: $GITHUB_REPOSITORY_DESCRIPTION"

# jq is like sed for JSON data
JQ_OUTPUT=$(
    jq \
        --arg NAME "@$GITHUB_REPOSITORY" \
        --arg AUTHOR "$GITHUB_REPOSITORY_OWNER https://github.com/$GITHUB_REPOSITORY_OWNER" \
        --arg REPOSITORY "github:@$GITHUB_REPOSITORY" \
        --arg BUGS "https://github.com/$GITHUB_REPOSITORY/issues" \
        --arg HOMEPAGE "https://github.com/$GITHUB_REPOSITORY#readme" \
        --arg VERSION "0.0.1" \
        --arg DESCRIPTION "$GITHUB_REPOSITORY_DESCRIPTION" \
        '.name = $NAME | .author = $AUTHOR | .repository = $REPOSITORY |
    .bugs = $BUGS | .homepage = $HOMEPAGE | .version = $VERSION | .description = $DESCRIPTION' \
        package.json
)

# Overwrite package.json
echo "$JQ_OUTPUT" >package.json

# Make sed command compatible in both Mac and Linux environments
# Reference: https://stackoverflow.com/a/38595160/8696958
sedi() {
    sed --version >/dev/null 2>&1 && sed -i -- "$@" || sed -i "" "$@"
}

# Rename instances of "qd-qd/template-js-lib" to the new repo name in README.md for badges only
sedi "/github-editor-url/ s|qd-qd/template-js-lib|"${GITHUB_REPOSITORY}"|;" "README.md"
sedi "/gha-quality-url/ s|qd-qd/template-js-lib|"${GITHUB_REPOSITORY}"|;" "README.md"
sedi "/gha-quality-badge/ s|qd-qd/template-js-lib|"${GITHUB_REPOSITORY}"|;" "README.md"
sedi "/gha-test-url/ s|qd-qd/template-js-lib|"${GITHUB_REPOSITORY}"|;" "README.md"
sedi "/gha-test-badge/ s|qd-qd/template-js-lib|"${GITHUB_REPOSITORY}"|;" "README.md"
sedi "/gha-release-url/ s|qd-qd/template-js-lib|"${GITHUB_REPOSITORY}"|;" "README.md"
sedi "/gha-release-badge/ s|qd-qd/template-js-lib|"${GITHUB_REPOSITORY}"|;" "README.md"
