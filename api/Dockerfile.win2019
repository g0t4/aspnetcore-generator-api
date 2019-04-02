FROM mcr.microsoft.com/dotnet/core/runtime:2.2

WORKDIR /app
COPY bin/Debug/netcoreapp2.2/netcoreapp2.2/publish .

ENTRYPOINT ["dotnet", "api.dll"]
