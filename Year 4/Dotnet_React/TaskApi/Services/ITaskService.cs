using TaskApi.Models;

namespace TaskApi.Services
{
    public interface ITaskService
    {
        Task<IEnumerable<TaskItem>> GetAllAsync(string? status = null);
        Task<TaskItem?> GetByIdAsync(int id);
        Task<TaskItem> CreateAsync(TaskItem item);
        Task UpdateAsync(int id, TaskItem item);
        Task DeleteAsync(int id);
    }
}
