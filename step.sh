#!/bin/bash

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "THIS_SCRIPT_DIR: ${THIS_SCRIPT_DIR}"

set -e


STARTTIME=$(date +%s)


echo $FRANK_TESTING_PROJECT_ROOT_DIR_PATH
echo $FRANK_TESTING_PROJECT_PATH

projectdir="$(dirname "${FRANK_TESTING_PROJECT_PATH}")"
echo $projectdir
cd $FRANK_TESTING_PROJECT_ROOT_DIR_PATH
cd $projectdir

set -v

brew install ios-sim

gem uninstall frank-cucumber -ax
gem uninstall json -ax

gem install json -v '1.8.1'
gem install frank-cucumber -N

frank build

sudo python "${THIS_SCRIPT_DIR}/tccutil.py" -i /usr/bin/osascript

cucumber Frank/features/my_first.feature


ENDTIME=$(date +%s)
echo
echo " (i) It took $(($ENDTIME - $STARTTIME)) seconds to complete this task"
echo


# return 0 as the exit code in case of success
# return >0 if the step failed
exit 0