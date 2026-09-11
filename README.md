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

helper file => docker_build.sh:
1. read .env on the docker and bash project
- backup decice data is got form .env in the bash project.

2. build command by Dockerfile.
3. stop and remove already started container.
4. run docker.
5. mount backup devieces.
----
Commands
- build docker image.
sudo chmod +x docker_build.sh
sudo ./docker_build.sh


