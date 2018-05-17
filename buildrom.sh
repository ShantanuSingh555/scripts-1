#!/bin/bash
#usage:
#	Place in root directory of build folder and
#        bash buildrom.sh devicecodename gdrive/afh -q

#prepare the environment
rm -rf venv
virtualenv2 venv
source venv/bin/activate
export LC_ALL=C
source build/envsetup.sh

#build rom and log the build
brunch $1 |& tee build.log

if [ $(grep -c "### make failed" build.log) = 0 ]; then

	#get the latest zip built
	file=$(ls out/target/product/$1/*201*.zip | tail -n 1)

	#if gdrive send a direct link to my testing group
	if [ $2 = "gdrive" ]; then
		id=$(gdrive upload --parent 13eTar2JcxqYJz93TLL86DucTw6iG4ZjR $file | grep "Uploaded" | cut -d " " -f 2)
		telegram-send "New Build is up:- https://drive.google.com/uc?export=download&id=$id"
	fi

	#if afh upload to afh through ftp
	if [ $2 = "afh" ]; then
	echo "user: "
	read user
	echo "password: "
	read password
	curl -T  $file ftp://uploads.androidfilehost.com --user $user:$password
	fi

else
	#if quiet option isn't specified, send status
		if [ "$3" != "-q" ]; then
			telegram-send "Build Failed"
		fi
fi
