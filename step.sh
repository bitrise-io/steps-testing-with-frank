#!/bin/bash

echo "HALLLO"
echo $FRANK_TESTING_PROJECT_ROOT_DIR_PATH
echo $FRANK_TESTING_PROJECT_PATH

projectdir="$(dirname "${FRANK_TESTING_PROJECT_PATH}")"
echo $projectdir
cd $FRANK_TESTING_PROJECT_ROOT_DIR_PATH
cd $projectdir

gem install frank-cucumber -N
frank build
brew install ios-sim
gem update json # 1.8.2 required
cucumber Frank/features/my_first.feature


# return 0 as the exit code in case of success
# return >0 if the step failed
exit 0