#Reference: https://stormpath.com/blog/tutorial-deploy-asp-net-core-on-linux-with-docker

######################CLIENT API DEPLOYMENT###################################

cd C:\_dev\_code\_github\aspnetcore_docker\k8.docker.app.client.user
docker build -t k8_client_user:release .
docker run -d -p 8080:5001  --name userclient k8_client_user:release
Start-Process "http://localhost:8080/swagger"

###########################################################################
######################Server API DEPLOYMENT################################

cd C:\_dev\_code\_github\aspnetcore_docker\k8.docker.app.server.user
docker build -t k8_server_user:release .
docker run -d -p 8081:5002  --name userserver k8_server_user:release
Start-Process "http://localhost:8081/swagger"
###########################################################################
docker ps -a
docker images -a


docker stop $(docker ps -a -q) 
docker rm $(docker ps -a -q) -f
docker rmi $(docker images -a -q) -f



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
docker inspect  ac30e3747d59

docker exec -it userclient /bin/bash

docker login -u=$$$$$ -p=$$$$$
    
docker tag k8_client_user:release khanasif1/k8_client_user:rc1


docker push khanasif1/k8_client_user:rc1

docker run -p 5000:5000 c418eaec17ed