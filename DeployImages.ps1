#Reference: https://stormpath.com/blog/tutorial-deploy-asp-net-core-on-linux-with-docker

######################CLIENT API DEPLOYMENT###################################

cd C:\_dev\_code\_github\aspnetcore_docker\k8.docker.app.client.user
docker build -t k8_client_user:rc2 .
docker run -d -p 8080:5001  --name userclient k8_client_user:rc2
Start-Process "http://localhost:8080/swagger"

###########################################################################
######################Server API DEPLOYMENT################################

cd C:\_dev\_code\_github\aspnetcore_docker\k8.docker.app.server.user
docker build -t k8_server_user:rc1 .
docker run -d -p 8081:5002  --name userserver k8_server_user:rc1
Start-Process "http://localhost:8081/swagger"
###########################################################################
########################Push Docker Hub####################################
docker login -u=$$$$ -p=$$$$
docker tag k8_client_user:rc2.5 khanasif1/k8_client_user:rc2.5
docker push khanasif1/k8_client_user:rc2.5


docker login -u=$$$$ -p=$$$$
docker tag k8_server_user:rc2.5 khanasif1/k8_server_user:rc2.5
docker push khanasif1/k8_server_user:rc2.5
#########################General Script######################################
docker ps -a            #get all containers
docker images -a        #get all images

docker stop $(docker ps -a -q)         # stop all containers
docker rm $(docker ps -a -q) -f        # remove all containers
docker rmi k8_server_user:rc2.5 -f
docker rmi k8_client_user:rc2.5 -f

docker rmi $(docker images -a -q) -f   # remove all images


#########################Docker Compose ###################################
cd C:\_dev\_code\_github\aspnetcore_docker
docker-compose build

docker-compose up --build -d
Start-Process "http://localhost:8080/swagger"
Start-Process "http://localhost:8081/swagger"

docker-compose down

###########################################################################
######################### IGNORE ##########################################
###########################################################################
docker images --filter "label=automation"

docker build -f "C:\_dev\_code\k8.docker\k8.docker.app.client.user\Dockerfile" -t k8dockerappclientuser:dev --target base  --label "com.microsoft.created-by=visual-studio" "C:\_dev\_code\k8.docker"

docker build -t k8_client_user:release .

docker run -it --rm -p 80:81 --name userclient k8_client_user:release

docker build -f "Dockerfile" -t k8_client_user:release --target base .  #--label "com.microsoft.created-by=automation" "C:\_dev\_code\k8.docker"

docker run -d -p 8080:5001  --name userclient k8dockerappclientuser:dev

docker build -f Dockerfile -t dockertest:dev --target base .
docker run -d -p 8080:5001  --name userclient dockertest:dev

docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" a356dff75862
docker inspect  f3374ecab85a

docker exec -it userclient /bin/bash

docker logs --follow f3374ecab85a

docker pull khanasif1/k8_client_user:rc2
docker run -d -p 8080:5001  --name kahnasif1user 1b7f0ce78ce9
docker pull khanasif1/k8_server_user:rc1
docker run -d -p 8081:5002  --name kahnasif1server 47a3726cfa6e