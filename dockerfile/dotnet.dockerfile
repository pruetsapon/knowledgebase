FROM microsoft/aspnet  

ARG source  

WORKDIR /inetpub/wwwroot

COPY ./Folder_API/ .

#COPY ./fonts/ .