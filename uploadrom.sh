#!/bin/bash  

#get the latest zip i built
file=$(ls out/target/product/mido/*201*.zip | tail -n 1)

#send a direct link to my testing group
if [ $1 = "gdrive" ]; then
	id=$(gdrive upload --parent 13eTar2JcxqYJz93TLL86DucTw6iG4ZjR $file | grep "Uploaded" | cut -d " " -f 2) 
	telegram-send "New Build is up:- https://drive.google.com/uc?export=download&id=$id"  
fi

#upload to afh through ftp
if [ $1 = "afh" ]; then
	echo "user: "
	read user
	echo "password: "
	read password
	curl -T  $file ftp://uploads.androidfilehost.com --user $user:$password
fi