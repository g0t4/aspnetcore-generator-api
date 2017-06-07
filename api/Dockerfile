FROM microsoft/aspnetcore-build:2

WORKDIR /api

COPY . .

RUN dotnet restore

RUN dotnet publish -o /publish

WORKDIR /publish

ENTRYPOINT ["dotnet", "/publish/api.dll"]