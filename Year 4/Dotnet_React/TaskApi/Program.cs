using Microsoft.EntityFrameworkCore;
using TaskApi.Data;
using TaskApi.Repositories;
using TaskApi.Services;

var builder = WebApplication.CreateBuilder(args);

// configuration from env or appsettings
var env = builder.Configuration;
var host = env.GetValue<string>("DB__HOST") ?? builder.Configuration.GetConnectionString("DefaultConnection") ?? "localhost";
// If DefaultConnection present, use it; else build from DB__ envs
var defaultConn = builder.Configuration.GetConnectionString("DefaultConnection");
string connectionString;
if (!string.IsNullOrEmpty(defaultConn))
{
    connectionString = defaultConn;
}
else
{
    var port = env.GetValue<string>("DB__PORT") ?? "3306";
    var user = env.GetValue<string>("DB__USER") ?? "taskuser";
    var pwd = env.GetValue<string>("DB__PASSWORD") ?? "taskpass";
    var name = env.GetValue<string>("DB__NAME") ?? "taskdb";
    connectionString = $"server={host};port={port};user={user};password={pwd};database={name};";
}

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Allow CORS for frontend dev server (adjust as needed)
builder.Services.AddCors(options =>
{
    options.AddPolicy(name: "AllowFrontend",
        policy => policy.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader());
});

builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString)));

builder.Services.AddScoped<ITaskRepository, TaskRepository>();
builder.Services.AddScoped<ITaskService, TaskService>();

var app = builder.Build();

// Ensure DB
using (var scope = app.Services.CreateScope())
{
    var db = scope.ServiceProvider.GetRequiredService<AppDbContext>();
    try
    {
        db.Database.EnsureCreated();
    }
    catch (Exception ex)
    {
        var logger = scope.ServiceProvider.GetRequiredService<ILogger<Program>>();
        logger.LogError(ex, "Failed to ensure DB created");
    }
}

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseCors("AllowFrontend");

app.UseAuthorization();

app.MapControllers();

app.Run();
