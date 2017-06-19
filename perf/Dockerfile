FROM microsoft/aspnetcore-build:2 AS build-env
WORKDIR /app
RUN dotnet new mvc
RUN dotnet restore
RUN dotnet publish -o /published

FROM microsoft/aspnetcore:2
COPY --from=build-env /published /published
WORKDIR /published
ENTRYPOINT ["dotnet", "app.dll"]
