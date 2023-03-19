#!/bin/bash

if [ "$1" == "g++" ]; then
 if [ -d build ]; then
    rm build/* -rf
 else
    mkdir build     
 fi

buildCommand="g++"
projectName=`pwd`
projectName=${projectName##*/}

buildCommand=$buildCommand" src/* -o ./build/"$projectName
if [ -d include ]; then
       buildCommand=$buildCommand" -I ./include/ "
       #echo buildCommand : $buildCommand
fi 
if [ -d lib ]; then
       buildCommand=$buildCommand" -L ./lib/ "
        for sharedLib in `ls ./lib/`; do
                sharedLib=${sharedLib#*lib}
                #echo $sharedLib
                sharedLib=${sharedLib%.a*}
                #echo $sharedLib
                buildCommand=$buildCommand" -l"$sharedLib
        done

       #echo buildCommand : $buildCommand
fi 

echo $buildCommand

exec $buildCommand

fi


if [ "$1" == "cmake" ]; then

        cd build
        cmake .. && cmake --build .
        cd -

fi
