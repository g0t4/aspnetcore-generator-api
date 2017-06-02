FROM microsoft/aspnetcore:2

WORKDIR /app
COPY bin/Debug/netcoreapp2.0/publish .

ENTRYPOINT ["dotnet", "api.dll"]
