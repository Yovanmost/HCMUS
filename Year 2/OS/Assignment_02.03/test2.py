class Process:
    def __init__(self, name, arrival_time, cpu_burst, priority=None):
        self.name = name
        self.arrival_time = arrival_time
        self.cpu_burst = cpu_burst
        self.priority = priority

def sjf(processes):
    # Sort processes based on arrival time
    processes.sort(key=lambda x: (x.arrival_time, x.cpu_burst))

    current_time = 0
    total_waiting_time = 0
    n = len(processes)

    print("Process\t Arrival Time\t CPU Burst\t Waiting Time\t Turnaround Time")

    while processes:
        min_burst_index = 0
        min_burst = processes[0].cpu_burst

        # Find the process with the minimum burst time among those arrived
        for i in range(1, len(processes)):
            if processes[i].arrival_time <= current_time and processes[i].cpu_burst < min_burst:
                min_burst = processes[i].cpu_burst
                min_burst_index = i

        # Update current time
        current_time += processes[min_burst_index].cpu_burst

        # Calculate waiting time and turnaround time
        waiting_time = current_time - processes[min_burst_index].arrival_time - processes[min_burst_index].cpu_burst
        total_waiting_time += waiting_time
        turnaround_time = current_time - processes[min_burst_index].arrival_time

        # Print process details
        print(f"{processes[min_burst_index].name}\t\t {processes[min_burst_index].arrival_time}\t\t {processes[min_burst_index].cpu_burst}\t\t {waiting_time}\t\t {turnaround_time}")

        # Remove the processed process
        del processes[min_burst_index]

    # Calculate and print average waiting time
    avg_waiting_time = total_waiting_time / n
    print(f"\nAverage Waiting Time: {avg_waiting_time}")

# Example usage:
if __name__ == "__main__":
    processes = [
        Process("P1", 2 , 6),
        Process("P2", 5, 2),
        Process("P3", 1, 8),
        Process("P4", 0, 3),
        Process("P5", 4, 4)
    ]
    sjf(processes)