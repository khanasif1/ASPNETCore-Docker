FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY k8.docker.app.client.user.csproj www/
RUN dotnet restore www/k8.docker.app.client.user.csproj
WORKDIR /src/www
COPY . .
RUN dotnet build k8.docker.app.client.user.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish k8.docker.app.client.user.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
EXPOSE 5001/tcp
ENV ASPNETCORE_URLS http://*:5001
ENTRYPOINT ["dotnet", "k8.docker.app.client.user.dll"]