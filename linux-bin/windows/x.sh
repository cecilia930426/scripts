#!/bin/bash
declare -A address=(
["m"]="/d/Dropbox/MindMap/" \
["b"]="/d/Dropbox/1_Course/Good_Books/" \
["bp"]="/d/Dropbox/1_Course/Good_Books/Photonics/" \
["be"]="/d/Dropbox/1_Course/Good_Books/Electronics/" \
["r"]="/d/2_RESEARCH/" \
["rd"]="/d/2_RESEARCH/Research_Dairy/latex/" \
["c"]="/d/Dropbox/1_Course/" \
["cc"]="/d/Dropbox/1_Course/1-2/" \
["cTA"]="/d/Dropbox/1_Course/1-2/TA-ELEC4310_Embedded_System/" \
["cca"]="/d/Dropbox/1_Course/1-2/ELEC6910K_ComputerArchitecture/" \
["co"]="/d/Dropbox/1_Course/1-2/ELEC4610_Optics/" \
#["bin"]="/c/Program\ Files/Git/usr/bin/" \ ->cd /bin
["it"]="/d/1_STUDY/1_Computer/"
)

declare -A subfolder=(
["p"]="image/" \
["a"]="assignment/" \
["l"]="lecture/" \
["lab"]="lab/"
)

if [[ $1 = "" ]]
then
    echo "Environment: (c,course,cc,this semester; r, research; b,book; m,mindmap)"
    echo "cca,course computer architecture; co,course optics; cTA,course TA"
    echo "rd, research dairy;"
    echo "bp, photonics book;be, device book"
    echo "_p:picture or image, _a:assigment;_l:lecture;_lab:lab"
    echo "input directory"
    read dirinput
else
    dirinput=$1
fi

n=$(expr index $dirinput _)
if [ $n != 0 ]
then
    fulladdress=${address[${dirinput:0:(n-1)}]}${subfolder[${dirinput:n}]}
else
    fulladdress=${address[$dirinput]}
fi

echo $fulladdress
cd $fulladdress

unset dirinput
unset fulladdress
