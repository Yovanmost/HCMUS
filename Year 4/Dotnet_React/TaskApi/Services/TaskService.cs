using TaskApi.Models;
using TaskApi.Repositories;

namespace TaskApi.Services
{
    public class TaskService : ITaskService
    {
        private readonly ITaskRepository _repo;

        public TaskService(ITaskRepository repo)
        {
            _repo = repo;
        }

        public async Task<TaskItem> CreateAsync(TaskItem item)
        {
            return await _repo.CreateAsync(item);
        }

        public async Task DeleteAsync(int id)
        {
            await _repo.DeleteAsync(id);
        }

        public async Task<IEnumerable<TaskItem>> GetAllAsync(string? status = null)
        {
            return await _repo.GetAllAsync(status);
        }

        public async Task<TaskItem?> GetByIdAsync(int id)
        {
            return await _repo.GetByIdAsync(id);
        }

        public async Task UpdateAsync(int id, TaskItem item)
        {
            var existing = await _repo.GetByIdAsync(id);
            if (existing == null) throw new KeyNotFoundException("Task not found");
            existing.Title = item.Title;
            existing.DueDate = item.DueDate;
            existing.Status = item.Status;
            await _repo.UpdateAsync(existing);
        }
    }
}
