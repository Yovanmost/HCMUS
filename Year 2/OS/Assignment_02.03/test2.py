class Process:
    def __init__(self, pid, arrival_time, burst_time, priority):
        self.pid = pid
        self.arrival_time = arrival_time
        self.burst_time = burst_time
        self.remaining_time = burst_time
        self.priority = priority

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

def srtn(processes):
    processes.sort(key=lambda p: (p.arrival_time, p.burst_time))  # Sort by arrival & burst time
    current_time = 0
    completed_processes = []
    chart = []  # Added for scheduling chart

    while processes:
    # Find the process with the shortest remaining time among arrived processes
        running_process = min(processes, key=lambda p: p.remaining_time)
        
        # Update current time if needed (preemption)
        current_time = max(current_time, running_process.arrival_time)
        chart.append(f"{current_time} ~{running_process.pid}~ ")  # Update chart

        # Execute the process for 1 unit
        running_process.remaining_time -= 1
        current_time += 1

        # Check for completion
        if running_process.remaining_time == 0:
        processes.remove(running_process)
        running_process.completion_time = current_time
        running_process.waiting_time = running_process.completion_time - running_process.arrival_time - running_process.burst_time
        completed_processes.append(running_process)
        
        # Check for newly arrived processes with shorter remaining time (preemption)
        new_arrived = [p for p in processes if p.arrival_time <= current_time and p != running_process]
        if new_arrived and min(new_arrived, key=lambda p: p.remaining_time).remaining_time < running_process.remaining_time:
        processes.append(running_process)  # Add running process back to queue
        processes.sort(key=lambda p: (p.arrival_time, p.burst_time))  # Resort based on arrival & burst time

    return completed_processes, chart

def priority_scheduling(processes):
  """
  Priority Scheduling Algorithm (Non-Preemptive)
  """
  processes.sort(key=lambda p: (p.arrival_time, -p.priority))  # Sort by arrival & priority (descending)
  current_time = 0
  completed_processes = []
  chart = []  # Added for scheduling chart

  for process in processes:
    current_time = max(current_time, process.arrival_time)
    chart.append(f"{current_time} ~{process.pid}~ ")  # Update chart
    process.completion_time = current_time + process.burst_time
    current_time += process.burst_time
    process.waiting_time = process.completion_time - process.arrival_time - process.burst_time
    completed_processes.append(process)
  return completed_processes, chart