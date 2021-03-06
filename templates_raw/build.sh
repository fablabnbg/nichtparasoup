#!/bin/sh


oldDir=$(pwd)

cd $(dirname $0)


######################

target="../templates.py"

######################

echo > $target

for builder in */build.sh
do
	echo "running $builder ... "

	echo -n $(basename $(dirname $builder)) >> $target
	echo -n ' = """' >> $target

	$builder 1>> $target

	echo -n '"""' >> $target

done

echo >> $target

#####################

cd $oldDir
