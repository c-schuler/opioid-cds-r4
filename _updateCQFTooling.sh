#!/bin/bash
r=releases
g=org.opencds.cqf
a=tooling-cli
v=2.2.0
dlurl='https://oss.sonatype.org/service/local/artifact/maven/redirect?r='${r}'&g='${g}'&a='${a}'&v='${v}''
input_cache_path=$PWD/input-cache/
tooling_jar=tooling-cli-2.2.0.jar

FORCE=false

if ! type "curl" > /dev/null; then
	echo "ERROR: Script needs curl to download latest IG Tooling. Please install curl."
	exit 1
fi

while [ "$#" -gt 0 ]; do
    case $1 in
    -f|--force)  FORCE=true ;;
    *)  echo "Unknown parameter passed: $1.  Exiting"; exit 1 ;;
    esac
    shift
done

tooling="$input_cache_path$tooling_jar"
if test -f "$tooling"; then
	echo "IG Tooling FOUND in input-cache"
	jarlocation="$tooling"
	jarlocationname="Input Cache"
	upgrade=true
else
	tooling="../$tooling_jar"
	upgrade=true
	if test -f "$tooling"; then
		echo "IG Tooling FOUND in parent folder"
		jarlocation="$tooling"
		jarlocationname="Parent Folder"
		upgrade=true
	else
		echo IG Tooling NOT FOUND in input-cache or parent folder...
		jarlocation="$input_cache_path$tooling_jar"
		jarlocationname="Input Cache"
		upgrade=false
	fi
fi

if [ $FORCE == false ] ; then 
	if [ $upgrade == true ] ; then
		message="Overwrite $jarlocation? [Y/N] "
	else
		echo Will place tooling jar here: $jarlocation
		message="Ok? [Y/N]"
		read -r -p "$message" response
	fi
else
  response=y
fi

if [[ "$response" =~ ^([yY])$ ]]; then
	echo "Downloading most recent tooling to $jarlocation - it's ~170 MB, so this may take a bit"
	curl $dlurl -L -o "$jarlocation" --create-dirs
	echo "Download complete."
else
	echo cancel...
fi
