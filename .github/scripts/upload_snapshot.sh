#!/bin/bash

echo $OSTYPE

echo "$SSH_PRIVATE_KEY" > ssh_key

if [[ "$OSTYPE" == "msys" ]]; then
  icacls.exe ssh_key //inheritance:r
else
  chmod 0600 ssh_key
fi

sftp -o StrictHostKeyChecking=no -i ssh_key $REMOTE_USER@$REMOTE_HOST <<END
cd /home/project-web/doublecmd/htdocs/snapshots
lcd /var/tmp/doublecmd-release
rm *.zip
put *.zip
put *.txt
quit
END
