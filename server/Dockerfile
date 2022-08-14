# Get the base SDK image from microsoft
FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS api-build

WORKDIR /source

# Copy the CSPROJ file(s) and restore any dependencies (via NUGET)
COPY *.sln .
COPY API/*.csproj ./API/
COPY Application/*.csproj ./Application/
COPY Domain/*.csproj ./Domain/
COPY Persistence/*.csproj ./Persistence/
RUN dotnet restore

# Copy the project files and build our release
COPY . ./
RUN dotnet publish -c Release -o /out

# Generate runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=api-build /out ./
ENTRYPOINT ["dotnet", "API.dll"]