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

## Links

- Troubleshooting Docker for Windows, the docs are wonderful: 
    - https://docs.docker.com/docker-for-windows/troubleshoot/ 
    - Especially, read "Limitations of Windows containers for localhost and published ports": https://docs.docker.com/docker-for-windows/troubleshoot/#limitations-of-windows-containers-for-localhost-and-published-ports

## Errata / Updates 

### 2.2.0 notes

- [ ] [Arm64/Linux] 2.2 docker images https://github.com/dotnet/dotnet-docker/issues/504

### 2.1.0 notes

- **Starting with .NET Core 2.1-preview2, the ASP.NET Core images (previously in  [`microsoft/aspnetcore`](https://hub.docker.com/r/microsoft/aspnetcore) & [`microsoft/aspnetcore-build`](https://hub.docker.com/r/microsoft/aspnetcore-build) ) will be consolidated into the Docker Hub [`microsoft/dotnet`](https://hub.docker.com/r/microsoft/dotnet/) repository.** 
    - **DOES NOT AFFECT 2.0 and 1.X images**.
    - **DOES NOT AFFECT non-aspnetcore apps**.
    - [Announcement: _Migrating from aspnetcore docker repos to dotnet_](https://github.com/aspnet/Announcements/issues/298)
    - *I've always wondered why separate aspnetcore repositories were necessary so I welcome this change!*
    - **Historically**, as mentioned in the course, we've had three repos:
        1. `microsoft/dotnet` 
            - General .NET Core development (non-aspnetcore apps, i.e. console apps)
            - Contains runtime/production images, i.e. `microsoft/dotnet:2-runtime`
            - Contains sdk/development images, i.e. `microsoft/dotnet:2-sdk`
        2. `microsoft/aspnetcore` 
            - Contains only runtime/production images for ASP.NET Core apps, i.e. `microsoft/aspnetcore:2`
        3. `microsoft/aspnetcore-build`
            - Contains only sdk/development images for ASP.NET Core apps, i.e. `microsoft/aspnetcore-build:2`
            - Also contains some front end build tools like nodejs
        - This division was confusing because for a general dotnet app you use one repo regardless if you need sdk or runtime, and then if you're developing ASP.NET Core then you have to pick a repo based on needing sdk (build) or runtime! SHEESH! Don't we have better things to worry about :) (I kid, .NET Core is so awesome I don't mind this inconvenience)
        - _2.1.300-preview1 is the last version of .NET Core in `aspnetcore/aspnetcore-build` repos_
        - [ ] AFAIK - aspnetcore nightly repos are stopping at v2.0 too
            - [`aspnetcore-build-nightly`](https://hub.docker.com/r/microsoft/aspnetcore-build-nightly/)
            - [`aspnetcore-nightly`](https://hub.docker.com/r/microsoft/aspnetcore-nightly/)
    - **Going forward**:
        - *I'm using .NET Core 1.X/2.0:*
            - DON'T CHANGE ANYTHING
            - "Legacy" repos / organization will remain
                - *phew! - can you imagine forcing every .NET Core Dockerfile ever to be updated! There's a good reason why things are left as is historically.*
            - Patches & security fixes will continue to be made available in these repositories
        - *I'm using .NET Core 2.1:*
            - Use `microsoft/dotnet`, that's it!
                - Ok, I lied... nightly builds are in [`microsoft/dotnet-nightly`](https://hub.docker.com/r/microsoft/dotnet-nightly)
            - **v2.1 is pre-release so all of this is subject to change :)**
            - *Common, tell me the specifics!* Ok...
                - `microsoft/dotnet:2-sdk` for developing any netcore app
                - `microsoft/dotnet:2-runtime` as a production base for non-aspnetcore apps
                - `microsoft/dotnet:2-aspnetcore-runtime` as a production base for aspnetcore apps
        - *I'm upgrading 1.X/2.0 to 2.1+*
            - [ ] TODO upgrade notes
        - [ ] TODO link announcement
    - [ ] TODO - rework course files to use 2.1
    - [ ] TODO other big 2.1 changes
- [ ] Review issues https://github.com/dotnet/dotnet-docker/issues/504
    - [ ] Update 2.1 Alpine images to be based on to latest https://github.com/dotnet/dotnet-docker/issues/488 
    - [ ] Add arm32v7 2.1-aspnetcore-runtime image https://github.com/dotnet/dotnet-docker/issues/480 
    - [ ] bionic image
    - [ ] 2.1 RC1 images https://hub.docker.com/r/microsoft/dotnet-nightly/

### 2.0.0 RTM notes

All branches in this repository have been updated for `2.0.0 RTM`. [Issue #3](https://github.com/g0t4/aspnetcore-generator-api/issues/3)

If you want to use a future release:
- Update `global.json` to appropriate sdk version.
- Update `csproj` files based on `dotnet new webapi` and `dotnet new xunit` templates.
- Address changes to app code. 

If a future release comes out and you don't want to update, change Dockerfile tags to explicitly reference `2.0.0`, i.e.
- `microsoft/dotnet:2.0.0-sdk` instead of `microsoft/dotnet:2-sdk`
- `microsoft/aspnetcore:2.0.0` instead of `microsoft/aspnetcore:2`
- `microsoft/aspnetcore-build:2.0.0` instead of `microsoft/aspnetcore-build:2`

If you want to use a pre-release version use the `-nightly` repos, i.e. 
- `microsoft/dotnet-nightly` instead of `microsoft/dotnet`

Announcements related to this course, since publishing: 
- During the previews of .NET Core 2.0, Debian Stretch was released. Both Stretch (v9) and Jessie (v8) images are available. As of .NET Core 2.0 RTM Stretch is now used in the multi-architecture tags. And, Stretch is now the default for the lifespan of .NET Core 2.x releases. https://github.com/dotnet/announcements/issues/16
- microsoft/dotnet & microsoft/dotnet-nightly image tags are now visually grouped by OS & CPU architecture https://github.com/dotnet/announcements/issues/27
- dotnet restore is now an implicit command, i.e. when you run dotnet build it will perform a restore if needed. That said, `dotnet restore` is still worthwhile to explicitly control when package restore occurs, for example to optimize the speed of building images as discussed in the courses. https://github.com/dotnet/announcements/issues/23

## Resources on Coming Changes

These are great resources for keeping up to date on what's coming next in .NET Core land:

- [.NET Announcements](https://github.com/dotnet/Announcements/issues)
- [ASP.NET Announcements](https://github.com/aspnet/Announcements/issues)
- [.NET Docker issues](https://github.com/dotnet/dotnet-docker/issues)
- [Docker for Windows release notes](https://docs.docker.com/docker-for-windows/edge-release-notes/)
- [Docker for Mac release notes](https://docs.docker.com/docker-for-mac/edge-release-notes/)
- [Docker CE release notes](https://docs.docker.com/release-notes/docker-ce/)
