#Build stage
FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env

WORKDIR /apps/generator

#restore
COPY api/api.csproj ./api/
RUN dotnet restore api/api.csproj

COPY test/test.csproj ./test/
RUN dotnet restore test/test.csproj

#copy src
COPY . .
RUN ls -laR

#run tests
RUN dotnet test test/test.csproj

#publish
RUN dotnet publish api/api.csproj -c Release -o /publish

#runtime stage
FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 as runtime-env
WORKDIR /apps/generator
COPY --from=build-env /publish .
ENTRYPOINT [ "dotnet" , "api.dll" ]
