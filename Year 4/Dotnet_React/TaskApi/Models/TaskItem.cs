using System.ComponentModel.DataAnnotations;

namespace TaskApi.Models
{
    public class TaskItem
    {
        public int Id { get; set; }

        [Required]
        public string Title { get; set; } = null!;

        public DateTime? DueDate { get; set; }

        // Use simple string for status: "Đang làm" or "Hoàn thành"
        public string Status { get; set; } = "Đang làm";
    }
}
