# Build Stage
FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env
WORKDIR /api

COPY api.csproj .
RUN dotnet restore

COPY . .
RUN dotnet publish -o /publish

# Runtime Image Stage
FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
WORKDIR /publish
COPY --from=build-env /publish .
ENTRYPOINT ["dotnet", "api.dll"]