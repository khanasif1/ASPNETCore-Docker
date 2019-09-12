# ASPNETCore-Docker

## Project Details
Project contains 2 core projecs:

* k8.docker.app.client.user
* k8.docker.app.server.user

Both the projects are APNET Core WebAPI projects. While setting the project I enabled docker setup for Linus OS for the project as a part of Visual Studio project creation.

## Run the Project
* Download project source using https or SSH
* Open the project using Visual Studio 2019 or older (not needed if you do not want to run locally)
* Each of the project has DockerFile, this file hass all the settings required to successfully build image
* Open [DeployImages.ps](https://github.com/khanasif1/ASPNETCore-Docker/blob/master/DeployImages.ps1) file in the root. This file has all docker commands which can used to build and run image for client and server Web API project

### Build and Run script
```
######################CLIENT################################################
cd {Your local folder location}\k8.docker.app.{client/server}.user
docker build -t k8_client_user:rc2.5 .
docker run -d -p 8080:5001  --name userclient k8_client_user:rc2.5
Start-Process "http://localhost:8080/swagger"

######################SERVER################################################
cd {Your local folder location}\k8.docker.app.server.user
docker build -t k8_server_user:rc2.5 .
docker run -d -p 8081:5002  --name userserver k8_server_user:rc2.5
Start-Process "http://localhost:8080/swagger"

```
## Authors

* **Asif Khan** - *Initial work* - [khanasif1](https://github.com/khanasif1)
