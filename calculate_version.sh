#!/bin/bash

LAST_VERSION=$1

MAJOR=$(git log --oneline $LAST_VERSION..HEAD --grep="major:" | wc -l)
MINOR=$(git log --oneline $LAST_VERSION..HEAD --grep="minor:" | wc -l)
PATCH=$(git log --oneline $LAST_VERSION..HEAD --grep="patch:" | wc -l)

if [ $MAJOR -gt 0 ]; then
    echo $(semver bump major $LAST_VERSION)
elif [ $MINOR -gt 0 ]; then
    echo $(semver bump minor $LAST_VERSION)
elif [ $PATCH -gt 0 ]; then
    echo $(semver bump patch $LAST_VERSION)
else
    echo "No specific bump keyword found. No version change."
fi
