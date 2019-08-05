#!/bin/sh        
WORKLIST=${1-workdir.list}
echo start clean file
for wdir in $(cat $WORKLIST)
	do
	if [ ! -d $wdir ]; then
		echo "directory no exists"
		exit 1
	fi
	echo clean before $(du -sh $wdir)
	# delete all file that modified 10 days ago or bigger than 100MB
	find $wdir -type f -mtime +10| xargs rm -f
	find $wdir -type f -size +100M| xargs rm -f
	echo clean after $(du -sh $wdir)
done
echo clean file end
