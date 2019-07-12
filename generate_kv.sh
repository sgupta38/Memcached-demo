#!/bin/bash

# This generates Key value database for given number of entries.
#
#

FILE_NAME=$1
ENTRIES=10737418240

if [ ! -f "$FILE_NAME" ]
then
	echo "File Not exists. Creating New"
	touch "$FILE_NAME"
else
	echo "Exists"
fi
i=0;
FILE_SIZE=$(stat -c%s "$FILE_NAME")
while [ $FILE_SIZE -lt $ENTRIES ]
do
	key=`head /dev/urandom | tr -dc A-Z | head -c 180`
	value=`head /dev/urandom | tr -dc A-Za-z0-9 | head -c 1024`
	#echo "$i_$key: $value"
	final_key=$i
	final_key+="_"
	final_key+=$key
	echo "$final_key: $value" >> $FILE_NAME
	i=$((i + 1))
	FILE_SIZE=$(stat -c%s "$FILE_NAME")
done

echo "size of $FILE_NAME = $FILE_SIZE "
