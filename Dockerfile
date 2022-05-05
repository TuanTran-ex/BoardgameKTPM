#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /src
COPY ["Mp3WebMusic.API/Mp3WebMusic.API.csproj", "Mp3WebMusic.API/"]
COPY ["Mp3WebMusic/Mp3WebMusic.DOMAIN.csproj", "Mp3WebMusic/"]
COPY ["Mp3WebMusic.BAL.INTERFACE/Mp3WebMusic.BAL.INTERFACE.csproj", "Mp3WebMusic.BAL.INTERFACE/"]
COPY ["Mp3WebMusic.BAL/Mp3WebMusic.BAL.csproj", "Mp3WebMusic.BAL/"]
COPY ["Mp3WebMusic.DAL.INTERFACE/Mp3WebMusic.DAL.INTERFACE.csproj", "Mp3WebMusic.DAL.INTERFACE/"]
COPY ["Mp3WebMusic.DAL/Mp3WebMusic.DAL.csproj", "Mp3WebMusic.DAL/"]
RUN dotnet restore "Mp3WebMusic.API/Mp3WebMusic.API.csproj"
COPY . .
WORKDIR "/src/Mp3WebMusic.API"
RUN dotnet build "Mp3WebMusic.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Mp3WebMusic.API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Mp3WebMusic.API.dll"]