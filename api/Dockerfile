# Build Stage
FROM mcr.microsoft.com/dotnet/core/sdk:2.2 as build-env
WORKDIR /api

COPY api.csproj .
RUN dotnet restore

COPY . .
RUN dotnet publish -o /publish

# Runtime Image State
FROM mcr.microsoft.com/dotnet/core/runtime:2.2 as runtime
WORKDIR /publish
COPY --from=build-env /publish .
ENTRYPOINT ["dotnet", "api.dll"]
