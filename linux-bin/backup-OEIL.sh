#!/bin/bash

#TODO: Jade Project Management
# echo "backup Jade-Project"
#rename with different name and Check the name in Jade Backup first, if there is no name conflict.
echo "backup files"
mv --backup=t *.tar.gz /media/shakir/Xuanqi/Linux-Syn/Research/OEIL-Backup          #save files into moveable disk

#echo "mv doc to Movable Disk"
#tar -czvf doc.tar.gz doc
#mv doc.tar.gz Jade-Backup

#echo "backup Exps"
#tar -czvf Exps.tar.gz Exps
#mv Exps.tar.gz Jade-Backup

