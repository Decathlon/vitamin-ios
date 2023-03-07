#!/usr/bin/env bash
# fail if any commands fails
set -e

# Test if we are in project root folder. And go in it if it's not the case.
if [ `pwd | sed 's#.*/##'` == "Scripts" ]; then
    cd ..
fi

NEW_VERSION="$1"
REGEX="^[0-9]*\.[0-9]*\.[0-9]*$"

# Set version
if [[ $NEW_VERSION =~ $REGEX ]]; then
  echo "Update version in README."
  sed -E -i '' "s/[0-9]+\.[0-9]+\.[0-9]+/$NEW_VERSION/g" README.md
  echo "Update podspecs version."
  sed -i '' "s/\(s.version *= \)\"[0-9]*\.[0-9]*\.[0-9]\"/\1\"$NEW_VERSION\"/g" *.podspec
else
  echo "Please provide a correct version. Should be $REGEX"
  exit 1
fi

# Commit version
git add README.md *.podspec
git commit -m "chore: set version to $NEW_VERSION"
