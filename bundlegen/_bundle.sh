#!/bin/bash
#DO NOT EDIT WITH WINDOWS
tooling_jar=tooling-1.3.1-SNAPSHOT-jar-with-dependencies.jar
input_cache_path=./input-cache
bundlegen_path=$PWD/bundlegen


set -e
echo Checking internet connection...
wget -q --spider tx.fhir.org

if [ $? -eq 0 ]; then
	echo "Online"
	fsoption=""
#"-fs http://cqm-sandbox.alphora.com/cqf-ruler-r4/fhir/"
else
	echo "Offline"
	fsoption=""
fi

echo "$fsoption"

tooling=$input_cache_path/$tooling_jar
if test -f "$tooling"; then
	echo "Running: JAVA -jar "$tooling "-BundleResources -ptd="$bundlegen_path" op="$bundlegen_path" -v=r4 -e=json"
	JAVA -jar $tooling -BundleResources -ptd=$bundlegen_path op=$bundlegen_path -v=r4 -e=json
else
	tooling=../$tooling_jar
	echo $tooling
	if test -f "$tooling"; then
		echo "Running: JAVA -jar "$tooling "-BundleResources -ptd="$bundlegen_path" op="$bundlegen_path" -v=r4 -e=json"
		JAVA -jar $tooling -BundleResources -ptd=$bundlegen_path op=$bundlegen_path -v=r4 -e=json
	else
		echo IG Refresh NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
	fi
fi
