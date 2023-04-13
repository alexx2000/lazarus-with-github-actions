#!/bin/bash

@ECHO OFF
echo "$SSH_PRIVATE_KEY" > ssh_key

icacls.exe ssh_key /reset
icacls.exe ssh_key /inheritance:r
icacls.exe ssh_key

echo "cd /home/project-web/doublecmd/htdocs/snapshots" > upload_snapshot.txt
echo "lcd /var/tmp/doublecmd-release" >> upload_snapshot.txt
echo "rm *.zip" >> upload_snapshot.txt
echo "put *.zip" >> upload_snapshot.txt
echo "put *.txt" >> upload_snapshot.txt
echo "quit" >> upload_snapshot.txt

sftp -o StrictHostKeyChecking=no -i ssh_key -b upload_snapshot.txt $REMOTE_USER@$REMOTE_HOST
