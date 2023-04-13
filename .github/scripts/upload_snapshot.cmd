@echo off
@echo %SSH_PRIVATE_KEY%> ssh_key

icacls.exe ssh_key /reset
rem icacls.exe ssh_key /grant:r "$USERNAME:(R)"
icacls.exe ssh_key /inheritance:r

echo cd /home/project-web/doublecmd/htdocs/snapshots> upload_snapshot.txt
echo lcd release>> upload_snapshot.txt
echo rm *.zip>> upload_snapshot.txt
echo put *.zip>> upload_snapshot.txt
echo put *.txt>> upload_snapshot.txt
echo quit>> upload_snapshot.txt

sftp -o StrictHostKeyChecking=no -i ssh_key -b upload_snapshot.txt %REMOTE_USER%@%REMOTE_HOST%
