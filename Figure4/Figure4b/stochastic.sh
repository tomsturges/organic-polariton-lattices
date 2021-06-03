#!/bin/bash
xmds2 org-pol-lat.xmds

# Make a new run directory, ensuring previous ones aren't overwritten
folder=run
i=0
printf -v j "%03d" $i
while [[ -d $folder$j ]] ; do
let i++
printf -v j "%03d" $i
done
folder=$folder$j
mkdir "$folder"
./org-pol-lat --help > $folder/parameters.txt
echo "$1" > $folder/noreps.txt

# Loop xmds over the variable
for i in $( seq 0 $1 )
do
    # xmds2 vibrons.xmds
    ./org-pol-lat
    mv org-pol-lat.h5 $folder/$i.h5
    mv org-pol-lat.xsil $folder/$i.xsil
done
