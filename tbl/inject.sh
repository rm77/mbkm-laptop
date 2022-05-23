SERIAL=$1

echo "copying file to $SERIAL"
adb -s $SERIAL push rsync-arm /data/rsync-arm
adb -s $SERIAL push akardokumen.xml /sdcard/akardokumen.xml
echo "extracting to $SERIAL"
adb -s $SERIAL shell 'chmod a+x /data/rsync-arm; cd /sdcard/DiktiEdu; nohup /data/rsync-arm -az --progress  --stats rsync://10.199.9.102:55000/files . > p.out 2>&1 &'
echo "selesai"
adb -s $SERIAL shell 'ps -edf | grep rsync'
