using Microsoft.EntityFrameworkCore;
using TaskApi.Data;
using TaskApi.Models;

namespace TaskApi.Repositories
{
    public class TaskRepository : ITaskRepository
    {
        private readonly AppDbContext _db;

        public TaskRepository(AppDbContext db)
        {
            _db = db;
        }

        public async Task<TaskItem> CreateAsync(TaskItem item)
        {
            _db.Tasks.Add(item);
            await _db.SaveChangesAsync();
            return item;
        }

        public async Task DeleteAsync(int id)
        {
            var ent = await _db.Tasks.FindAsync(id);
            if (ent == null) return;
            _db.Tasks.Remove(ent);
            await _db.SaveChangesAsync();
        }

        public async Task<IEnumerable<TaskItem>> GetAllAsync(string? status = null)
        {
            var q = _db.Tasks.AsQueryable();
            if (!string.IsNullOrEmpty(status))
            {
                q = q.Where(t => t.Status == status);
            }
            return await q.OrderBy(t => t.Id).ToListAsync();
        }

        public async Task<TaskItem?> GetByIdAsync(int id)
        {
            return await _db.Tasks.FindAsync(id);
        }

        public async Task UpdateAsync(TaskItem item)
        {
            _db.Tasks.Update(item);
            await _db.SaveChangesAsync();
        }
    }
}
