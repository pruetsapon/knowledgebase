# curl is a command line tool to transfer data to or from a server

# Syntax:
# curl [options] [URL...]

# Send POST request with the Curl command
curl -X POST --header "Content-Type:application/json" --data "username=admin&password=123456" https://www.example.com/login

# Download a file using the curl command
curl -O http://www.example.com/example_file.zip

# Send cookies using Curl command
curl -b "key=1234" -O http://www.example.com/example_file.zip

# Download -O or Upload -T files from or to FTP server
curl -u username:password -O ftp://example_server/example_file.tar.gz

# Using proxies with Curl Command
curl -x 192.168.143.106:8080 -O http://www.example.com/example_file.zip