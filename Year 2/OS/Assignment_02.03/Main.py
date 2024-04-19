class Process:
    def __init__(self, name, arrival_time, cpu_burst, priority=None):
        self.name = name
        self.arrival_time = arrival_time
        self.cpu_burst = cpu_burst
        self.priority = priority

# Tính thời gian chờ đợi của mỗi quy trình
def calculate_waiting_time(processes, completion_times):
    waiting_times = []
    for process, completion_time in zip(processes, completion_times):
        waiting_time = completion_time - process.arrival_time - process.cpu_burst
        waiting_times.append(waiting_time)
    return waiting_times

# Tính thời gian turnaround của mỗi quy trình
def calculate_turnaround_time(processes, completion_times):
    turnaround_times = []
    for process, completion_time in zip(processes, completion_times):
        turnaround_time = completion_time - process.arrival_time
        turnaround_times.append(turnaround_time)
    return turnaround_times

# Hàm đọc file dữ liệu
def read_input_file(file_name):
    with open(file_name, 'r') as file:
        lines = file.readlines()
        num_processes, quantum = map(int, lines[0].split())
        processes = []
        for line in lines[1:]:
            data = line.split()
            name, arrival_time, cpu_burst = data[:3]
            if len(data) == 4:
                priority = int(data[3])
                processes.append(Process(name, int(arrival_time), int(cpu_burst), priority))
            else:
                processes.append(Process(name, int(arrival_time), int(cpu_burst)))
    return quantum, processes

# Ghi kết quả vào tập tin
def write_output(file_name, scheduling_chart, processes, waiting_times, turnaround_times):
    with open(file_name, 'w') as file:
        file.write("Scheduling chart: " + scheduling_chart + "\n\n")
        for process, turnaround_time, waiting_time in zip(processes, turnaround_times, waiting_times):
            file.write(f"{process.name}: \tTT = {turnaround_time:.0f} \tWT = {waiting_time:.0f}\n")
        average_turnaround_time = sum(turnaround_times) / len(turnaround_times)
        average_waiting_time = sum(waiting_times) / len(waiting_times)
        file.write(f"Average: \tTT = {average_turnaround_time:.2f} \tWT = {average_waiting_time:.2f}\n")

# Thuật toán lập lịch FCFS
def FCFS(processes):
    processes.sort(key=lambda x: x.arrival_time)
    scheduling_chart = "0"
    completion_times = [0] * len(processes)
    for i, process in enumerate(processes):
        completion_times[i] = max(process.arrival_time, completion_times[i-1]) + process.cpu_burst
        scheduling_chart += f" ~{process.name}~ {completion_times[i]} "
    return scheduling_chart, completion_times

# Thuật toán lập lịch RR
def RR(processes, quantum):
    time = 0
    remaining_bursts = [process.cpu_burst for process in processes]
    scheduling_chart = "0"
    completion_times = [0] * len(processes)
    while any(remaining_bursts):
        for i, burst in enumerate(remaining_bursts):
            if burst > 0:
                run_time = min(quantum, burst)
                scheduling_chart += f" ~{processes[i].name}~ {time + run_time} "
                time += run_time
                remaining_bursts[i] -= run_time
                completion_times[i] = max(completion_times[i], time)
    return scheduling_chart, completion_times

# Thuật toán lập lịch SJF không chia cắt
def SJF_Nonpreemptive(processes):
    # Sắp xếp các tiến trình theo thời gian đến và thời gian thực thi ngắn nhất
    processes.sort(key=lambda x: (x.arrival_time, x.cpu_burst))
    scheduling_chart = "0"
    completion_times = [0] * len(processes)
    time = 0 
    for i, process in enumerate(processes):
        # Nếu thời gian hiện tại nhỏ hơn thời gian đến của tiến trình, đặt thời gian hiện tại bằng thời gian đến của tiến trình
        if time < process.arrival_time:
            time = process.arrival_time
        completion_times[i] = time + process.cpu_burst
        scheduling_chart += f" ~{process.name}~ {completion_times[i]} "
        time += process.cpu_burst
    return scheduling_chart, completion_times

# Thuật toán lập lịch theo ưu tiên không chia cắt
def Priority_Nonpreemptive(processes):
    # Sắp xếp các tiến trình theo thời gian đến và độ ưu tiên
    processes.sort(key=lambda x: (x.arrival_time, x.priority))
    scheduling_chart = "0"
    completion_times = [0] * len(processes)
    time = 0 
    for i, process in enumerate(processes):
        # Nếu thời gian hiện tại nhỏ hơn thời gian đến của tiến trình, đặt thời gian hiện tại bằng thời gian đến của tiến trình
        if time < process.arrival_time:
            time = process.arrival_time
        completion_times[i] = time + process.cpu_burst
        scheduling_chart += f" ~{process.name}~ {completion_times[i]} "
        time += process.cpu_burst
    return scheduling_chart, completion_times

def RR_scheduling(processes, quantum) :
    # Chạy thuật toán lập lịch
    chart, completion_times = RR(processes, quantum)

    # Tính thời gian chờ đợi và turnaround
    waiting_times = calculate_waiting_time(processes, completion_times)
    turnaround_times = calculate_turnaround_time(processes, completion_times)

    # Ghi kết quả vào tập tin
    write_output("RR.txt", chart, processes, waiting_times, turnaround_times)

def FCFS_scheduling(processes):
    # Chạy thuật toán lập lịch
    chart, completion_times = FCFS(processes)

    # Tính thời gian chờ đợi và turnaround
    waiting_times = calculate_waiting_time(processes, completion_times)
    turnaround_times = calculate_turnaround_time(processes, completion_times)

    # Ghi kết quả vào tập tin
    write_output("FCFS.txt", chart, processes, waiting_times, turnaround_times)

def SJF_Nonpreemptives_cheduling(processes):
    # Chạy thuật toán lập lịch
    chart, completion_times = SJF_Nonpreemptive(processes)

    # Tính thời gian chờ đợi và turnaround
    waiting_times = calculate_waiting_time(processes, completion_times)
    turnaround_times = calculate_turnaround_time(processes, completion_times)

    # Ghi kết quả vào tập tin
    write_output("SJF.txt", chart, processes, waiting_times, turnaround_times)

def Priority_Nonpreemptive_cheduling(processes):
    # Chạy thuật toán lập lịch
    chart, completion_times = Priority_Nonpreemptive(processes)

    # Tính thời gian chờ đợi và turnaround
    waiting_times = calculate_waiting_time(processes, completion_times)
    turnaround_times = calculate_turnaround_time(processes, completion_times)

    # Ghi kết quả vào tập tin
    write_output("Priority.txt", chart, processes, waiting_times, turnaround_times)

def main():
    # Đọc dữ liệu đầu vào
    file_name = "Input.txt"
    quantum, processes = read_input_file(file_name)
    processes_priority = processes.copy()
    processes_sjf = processes.copy()

    # Gọi các thuật toán lập lịch
    RR_scheduling(processes, quantum)
    FCFS_scheduling(processes)
    SJF_Nonpreemptives_cheduling(processes_sjf)
    Priority_Nonpreemptive_cheduling(processes_priority)

if __name__ == "__main__":
    main()
