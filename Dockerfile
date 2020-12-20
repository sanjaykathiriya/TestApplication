FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /app

#Copy the csproj file first to restore required packages

COPY *.csproj .
COPY *.config .

RUN dotnet restore --disable-parallel --configfile ./nuget.config 

#Copy all the source code into the Build Container
COPY . .

# Run dotnet publish in the Build Container
# Generates output available in /app/out
# Since the current directory is /app

RUN dotnet publish -c Release -o out
