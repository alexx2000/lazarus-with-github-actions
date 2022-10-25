#!/bin/bash

echo "$SSH_PRIVATE_KEY" > ssh_key && chmod 0600 ssh_key
sftp -o StrictHostKeyChecking=no -i ssh_key -b ./.github/upload.txt $REMOTE_USER@$REMOTE_HOST


