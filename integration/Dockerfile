FROM microsoft/dotnet:2-sdk
WORKDIR /integration

COPY integration.csproj .
RUN dotnet restore

COPY . .
ENTRYPOINT ["dotnet", "test"]
