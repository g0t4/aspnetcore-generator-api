FROM microsoft/aspnetcore-build:2

WORKDIR /api

COPY . .

RUN dotnet restore

RUN dotnet publish -o /publish

ENTRYPOINT ["dotnet", "/publish/api.dll"]