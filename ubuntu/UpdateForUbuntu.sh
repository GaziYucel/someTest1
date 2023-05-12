# @file ubuntu/UpdateForUbuntu.sh
#
# Copyright (c) 2023+ TIB Hannover
# Copyright (c) 2023+ Gazi Yucel
# Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
#
# @brief Install/update to latest LuaTex binaries for Ubuntu

echo "# variables"
dateTime=$(date +%Y-%m-%d_%H-%M-%S)
scriptUrl="//contextgarden.net/standalone/setup/first-setup.sh"
scriptName="first-setup.sh"
workDir="luatex"
echo "# dateTime: $dateTime"
echo "# scriptUrl: $scriptUrl"
echo "# scriptName: $scriptName"
echo "# workDir: $workDir"

echo "# working dir: start UpdateForUbuntu.sh"
readlink -f .

echo "# check if rsync is installed, install if not"
if [ ! -x "$(which rsync)" ]; then
  echo "# install rsync"
	sudo apt update
  sudo apt install rsync
else
    echo "# rsync already installed"
fi

echo "# remove directory $workDir recursively"
rm -rf "$workDir"

echo "# create path $workDir"
mkdir "$workDir"

echo "# change directory to $workDir"
cd "$workDir" || exit 1

echo "# working dir: cd $workDir"
readlink -f .

echo "# get latest install script"
rsync -ptv rsync:$scriptUrl ./$scriptName || exit 1

echo "# execute install script"
sh ./$scriptName

echo "# create file $workDir/_updated_$dateTime.txt"
echo "$dateTime" > "./_updated_$dateTime.txt"

echo "# change directory to parent"
cd ..

echo "# working dir: end UpdateForUbuntu.sh"
readlink -f .

echo "# end UpdateForUbuntu.sh"
