Access this repository: http://bit.ly/aspnetcoredocker

## Branch to course mapping

This repository contains source code for two courses:
- **Docker Images and Containers for ASP.NET Core**
    - The starting point is [pluralsight-images-start](https://github.com/g0t4/aspnetcore-generator-api/tree/pluralsight-images-start). Also [master](https://github.com/g0t4/aspnetcore-generator-api/)
    - The stopping point is [pluralsight-images-end](https://github.com/g0t4/aspnetcore-generator-api/tree/pluralsight-images-end)
- **Building a Deployment Pipeline for ASP.NET Core with Docker**
    - The starting point is [pluralsight-pipeline-start](https://github.com/g0t4/aspnetcore-generator-api/tree/pluralsight-pipeline-start)
    - The stopping point is [pluralsight-pipeline-end](https://github.com/g0t4/aspnetcore-generator-api/tree/pluralsight-pipeline-end)
    - The `docker config` example: [docker-config-prodappsettings](https://github.com/g0t4/aspnetcore-generator-api/tree/docker-config-prodappsettings)
    - The NGINX reverse proxy example: [nginx-proxy](https://github.com/g0t4/aspnetcore-generator-api/tree/nginx-proxy)
    - The performance testing environment: [perf](https://github.com/g0t4/aspnetcore-generator-api/tree/perf)
- The [course](https://github.com/g0t4/aspnetcore-generator-api/tree/course) branch is what I used throughout both courses as a single branch of all changes minus the above three one-off branches at the end of the second course.

## Errata / Updates 

I will be updating the above branches through .NET Core 2.0 RTM, here is what I'm updating:

preview1 to preview2 updates:
- Remove or update [api/global.json](api/global.json) to the appropriate 2.0 preview 
- Update packages in [api/api.csproj](api/api.csproj) replace `2.0.0-preview1-final` with `2.0.0-preview2-final`
- Update `Microsoft.NET.Test.Sdk` in [tests/tests.csproj](tests/tests.csproj) and  [integration/integration.csproj](integration/integration.csproj) to `15.3.0-preview-20170517-02` for preview2 (optional)
- Prior to 2.0 RTM, in `Dockerfiles` you might want to use tags that specify the exact preview version, i.e. `microsoft/dotnet:2.0.0-preview1-sdk` instead of `microsoft/dotnet:2-sdk` 