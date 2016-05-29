#! /bin/bash
backup_list="src top_files README.md journal graphs sistemas-de-partida"

for folder in $backup_list
do
	echo "------------ syncronizo $folder ------------"
	rsync -rvzh --update -e 'ssh -p4222' $folder patricio@200.5.224.86:/home/patricio/hemo
	ssh -p4222 patricio@200.5.224.86 rsync -rvzh --update -e 'ssh' hemo/$folder pato@10.6.0.122:/home/pato/hemo/
	echo "------------ listo con $folder ------------"		
done
exit 0
