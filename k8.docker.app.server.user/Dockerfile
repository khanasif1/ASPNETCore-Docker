FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY k8.docker.app.server.user.csproj www/
RUN dotnet restore www/k8.docker.app.server.user.csproj
WORKDIR /src/www
COPY . .
RUN dotnet build k8.docker.app.server.user.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish k8.docker.app.server.user.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
EXPOSE 5002/tcp
ENV ASPNETCORE_URLS http://*:5002
ENTRYPOINT ["dotnet", "k8.docker.app.server.user.dll"]