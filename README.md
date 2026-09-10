# docker_df_backupsys01_prod
training docker file.

"what does this project?"
a bash file is executed on a ubuntu server(version latest).

"what i plan"
basic plan:
- don't use  compose.yaml
- if this server is started the bash file is also executed. 
- bash files is in another project directory.
- bash file path is saved in .env.
- to read Dockerfile inoder to .env file create a helper file. 

Dockerfile:
1. use ubuntu image.
2. copy bash project path
3. run bash project

helper file:
1. set command to read .env
2. build command by Dockerfile.
----
Commands
1. build docker image.
sudo chmod +x docker_build.sh
sudo ./docker_build.sh

2. run command dockers
sudo docker run -d --name backupsys_server --restart unless-stopped backupsys_server_test


