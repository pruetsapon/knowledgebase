# Running a command on the remote server

ssh username@domain
# or
ssh -p yourport username@domain

# command move file on server to local

scp username@domain:/home/yourusername/* .
# or
scp -P yourport username@domain:/home/yourusername/examplefile .

# command move file on local to server

scp -r examplefile username@domain:~/
# or
scp -r -P yourport examplefile username@domain:~/