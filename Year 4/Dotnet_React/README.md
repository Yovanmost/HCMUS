# Personal Task Manager (Dotnet 8 + React Vite)

This repository contains a simple Personal Task Manager with:

- `TaskApi/` - ASP.NET Core Web API (.NET 8) using EF Core + Pomelo MySQL provider
- `task-client/` - React (Vite) frontend that calls the API via Axios
- `docker-compose.yml` - Docker Compose setup for MySQL and Adminer

Quick start

1. Start MySQL with Docker Compose (from repo root):

```pwsh
docker compose up -d
```

This starts MySQL on port `3306` with database `taskdb` and Adminer on `8080`.

2. Backend

- Edit `TaskApi/appsettings.json` or set `DB__HOST`, `DB__PORT`, `DB__USER`, `DB__PASSWORD`, `DB__NAME` in environment to match Docker Compose (defaults provided).
- Run the backend (requires .NET 8 SDK):

```pwsh
cd "c:/Repo/HCMUS/Year 4/Dotnet_React/TaskApi"
dotnet restore
dotnet run --urls "http://localhost:5000"
```

The API will be available at `http://localhost:5000/api/tasks`.

3. Frontend

```pwsh
cd "c:/Repo/HCMUS/Year 4/Dotnet_React/task-client"
npm install
npm run dev
```

Open the Vite dev server (it will show the address, typically `http://localhost:5173`). The frontend calls the backend at `http://localhost:5000`.

<!-- Notes

- The backend will ensure the database is created on startup (code-first). If you prefer EF migrations, run `dotnet ef migrations add Initial` and `dotnet ef database update`.
- If you run MySQL locally instead of Docker, update connection string in `TaskApi/appsettings.json`. -->