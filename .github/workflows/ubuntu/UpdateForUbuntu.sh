# @file UpdateForUbuntu.sh
#
# Copyright (c) 2023+ TIB Hannover
# Copyright (c) 2023+ Gazi Yucel
# Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
#
# @brief Submodule to be used in the Open Journal Systems plugin latexConverter.

echo "# variables"
dateTime=$(date +%Y-%m-%d_%H-%M-%S)
scriptUrl="//contextgarden.net/standalone/setup/first-setup.sh"
scriptName="first-setup.sh"
subModulePath="luatex"
echo "# variables"
echo "# dateTime: $dateTime"
echo "# scriptUrl: $scriptUrl"
echo "# scriptName: $scriptName"
echo "# subModulePath: $subModulePath"

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

echo "# remove directory $subModulePath recursively"
rm -rf "$subModulePath"

echo "# create path $subModulePath"
mkdir "$subModulePath"

echo "# change directory to $subModulePath"
cd "$subModulePath"

echo "# working dir: cd $subModulePath"
readlink -f .

echo "# get latest install script"
# rsync -ptv rsync:$scriptUrl ./$scriptName || exit 1

echo "# execute install script"
# sh ./$scriptName

echo "# create file $subModulePath/_updated_$dateTime.txt"
echo "$dateTime" > "./_updated_$dateTime.txt"

echo "# change directory to parent"
cd ..

echo "# working dir: end UpdateForUbuntu.sh"
readlink -f .

echo "# end UpdateForUbuntu.sh"
