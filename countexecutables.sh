#!/bin/bash

function CountExecutables () {
	IFS=":"
	exCount=0
	nonexCount=0

	for directory in $PATH
	do
		if [[ -d $directory ]]
		then
			for comm in "$directory"/*
			do
				if [[ -x $comm ]]
				then
					echo "$comm"
					exCount=$(( $exCount + 1 ))
				else
					nonexCount=$(( $nonexCount + 1 ))
				fi
			done
		fi
	done

	echo "Total executables: $exCount"
	echo "Total non-executables: $nonexCount"
}

CountExecutables
