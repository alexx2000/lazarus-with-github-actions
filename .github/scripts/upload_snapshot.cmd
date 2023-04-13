#!/bin/bash

@ECHO OFF
echo "$SSH_PRIVATE_KEY" > ssh_key

icacls.exe ssh_key /reset
#icacls.exe ssh_key /grant:r "$USERNAME:(R)"
icacls.exe ssh_key /inheritance:r

sftp -o StrictHostKeyChecking=no -i ssh_key $REMOTE_USER@$REMOTE_HOST <<END
cd /home/project-web/doublecmd/htdocs/snapshots
lcd /var/tmp/doublecmd-release
rm *.zip
put *.zip
put *.txt
quit
END
