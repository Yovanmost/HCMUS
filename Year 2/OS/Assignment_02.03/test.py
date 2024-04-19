class Process:
    def __init__(self, pid, arrival_time, burst_time, priority):
        self.pid = pid
        self.arrival_time = arrival_time
        self.burst_time = burst_time
        self.remaining_time = burst_time
        self.priority = priority

def sjf(processes):
    processes.sort(key=lambda x: (x.arrival_time, x.burst_time))
    current_time = 0
    for process in processes:
        current_time = max(current_time, process.arrival_time)
        process.completion_time = current_time + process.burst_time
        current_time += process.burst_time

# Nonpreemptive version:  the running process finishes its task then the highest priority process will be allocated the CPU
def priority_scheduling(processes):
    processes.sort(key=lambda x: (x.arrival_time, x.priority))
    current_time = 0
    for process in processes:
        current_time = max(current_time, process.arrival_time)
        process.completion_time = current_time + process.burst_time
        current_time += process.burst_time

def read_input_file(file_name):
    processes = []
    with open(file_name, 'r') as file:
        lines = file.readlines()
        for line in lines[1:]:
            data = line.split()
            processes.append(Process(data[0], int(data[1]), int(data[2]), int(data[3])))
    return processes


def write_output_file(processes, file_name):
    scheduling_chart = "Scheduling chart: 0"
    turnaround_times = []
    waiting_times = []
    with open(file_name, 'w') as file:
        for process in processes:
            file.write(f"{process.pid}:                       TT = {process.completion_time - process.arrival_time}               WT = {process.completion_time - process.arrival_time - process.burst_time}\n")
            scheduling_chart += f" ~{process.pid}~ {process.completion_time}"
            turnaround_times.append(process.completion_time - process.arrival_time)
            waiting_times.append(process.completion_time - process.arrival_time - process.burst_time)
        average_turnaround_time = sum(turnaround_times) / len(turnaround_times)
        average_waiting_time = sum(waiting_times) / len(waiting_times)
        file.write(f"Average:             TT = {average_turnaround_time:.2f}          WT = {average_waiting_time:.2f}\n")
    scheduling_chart += "\n"
    with open(file_name, 'r+') as file:
        content = file.read()
        file.seek(0, 0)
        file.write(scheduling_chart + content)

if __name__ == "__main__":
    input_file = "input.txt"
    
    # Đọc thông tin tiến trình từ file input
    processes = read_input_file(input_file)

    sjf_processes = processes.copy()
    sjf(sjf_processes)
    write_output_file(sjf_processes, "output_sjf.txt")

    priority_processes = processes.copy()
    priority_scheduling(priority_processes)
    write_output_file(priority_processes, "output_priority.txt")