FROM mcr.microsoft.com/dotnet/core/sdk:2.2

WORKDIR /app
COPY . .
RUN dir

RUN dotnet restore
RUN dotnet publish -o /publish

WORKDIR /publish

ENTRYPOINT ["dotnet", "/publish/api.dll"]
