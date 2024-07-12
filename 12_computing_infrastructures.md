### Hands-On Tutorials for `top`, `htop`, and `vmstat`

#### 1. `top`

The `top` command provides a dynamic, real-time view of the system’s processes. It displays system summary information and a list of tasks currently being managed by the Linux kernel.

**Basic Usage:**
```sh
top
```

**Examples:**

1. **Start `top`:**
   ```sh
   top
   ```
   **Expected Output:**
   ```sh
   top - 12:34:56 up  1:23,  2 users,  load average: 0.15, 0.25, 0.35
   Tasks: 150 total,   1 running, 149 sleeping,   0 stopped,   0 zombie
   %Cpu(s):  1.5 us,  0.5 sy,  0.0 ni, 97.5 id,  0.5 wa,  0.0 hi,  0.0 si,  0.0 st
   MiB Mem :  8000.0 total,  1000.0 free,  2000.0 used,  5000.0 buff/cache
   MiB Swap:  2000.0 total,  1900.0 free,   100.0 used.  5500.0 avail Mem 

     PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND                                                                 
   1234 root      20   0  500000  10000   5000 S   1.0   0.1   0:01.00 some_process
   ...
   ```
   **Discussion:**
   - **System Summary Information:**
     - **12:34:56:** Current time.
     - **up 1:23:** System uptime.
     - **2 users:** Number of logged-in users.
     - **load average:** System load averages for the past 1, 5, and 15 minutes.
   - **Task Information:**
     - **150 total:** Total number of processes.
     - **1 running:** Number of running processes.
     - **149 sleeping:** Number of sleeping processes.
     - **0 stopped:** Number of stopped processes.
     - **0 zombie:** Number of zombie processes.
   - **CPU Information:**
     - **%Cpu(s):** Breakdown of CPU usage.
     - **1.5 us:** Percentage of CPU used by user processes.
     - **0.5 sy:** Percentage of CPU used by system (kernel) processes.
     - **97.5 id:** Percentage of CPU idle time.
     - **0.5 wa:** Percentage of CPU time waiting for I/O.
   - **Memory Information:**
     - **MiB Mem:** Total, free, used, and buffer/cache memory.
     - **MiB Swap:** Total, free, and used swap memory.
   - **Process List:**
     - **PID:** Process ID.
     - **USER:** Process owner.
     - **PR:** Priority.
     - **NI:** Nice value.
     - **VIRT:** Virtual memory used.
     - **RES:** Resident memory used.
     - **SHR:** Shared memory used.
     - **S:** Process state (e.g., S = sleeping, R = running).
     - **%CPU:** CPU usage percentage.
     - **%MEM:** Memory usage percentage.
     - **TIME+:** Total CPU time used.
     - **COMMAND:** Command name.

2. **Sort by Memory Usage:**
   ```sh
   top
   ```
   - Press `M` while `top` is running.
   **Expected Output:**
   ```sh
   ...
   MiB Mem :  8000.0 total,  1000.0 free,  2000.0 used,  5000.0 buff/cache
   MiB Swap:  2000.0 total,  1900.0 free,   100.0 used.  5500.0 avail Mem 

     PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND                                                                 
   2345 user      20   0  600000  30000  10000 S   2.0   0.3   0:02.00 another_process
   1234 root      20   0  500000  10000   5000 S   1.0   0.1   0:01.00 some_process
   ...
   ```
   **Discussion:**
   - Pressing `M` sorts processes by memory usage, showing the processes using the most memory at the top.

3. **Filter by User:**
   ```sh
   top
   ```
   - Press `u` and then type the username (e.g., `root`).
   **Expected Output:**
   ```sh
   ...
   PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND                                                                 
   1234 root      20   0  500000  10000   5000 S   1.0   0.1   0:01.00 some_process
   ...
   ```
   **Discussion:**
   - Pressing `u` allows you to filter processes by a specific user, displaying only the processes owned by that user.

4. **Kill a Process:**
   ```sh
   top
   ```
   - Press `k`, then type the PID of the process to kill (e.g., `1234`), and then press `Enter`.
   **Expected Output:**
   ```sh
   No visible output; process is terminated.
   ```
   **Discussion:**
   - Pressing `k` followed by the PID terminates the specified process.

#### 2. `htop`

The `htop` command is an interactive process viewer for Unix systems. It is similar to `top`, but allows for more user-friendly operation, including scrolling and process management.

**Basic Usage:**
```sh
htop
```

**Examples:**

1. **Start `htop`:**
   ```sh
   htop
   ```
   **Expected Output:**
   ```sh
   1  [||                                                                                     1.0%]   Tasks: 150, 0 thr; 2 running
   2  [|||||||||||                                                                            5.0%]   Load average: 0.15 0.25 0.35 
   3  [|                                                                                      0.5%]   Uptime: 1:23
   4  [||                                                                                     1.0%]
   
   PID USER      PRI  NI  VIRT   RES   SHR S CPU% MEM%   TIME+  Command
   1234 root      20   0  500M   10M   5M  S  1.0  0.1  0:01.00 some_process
   ...
   ```
   **Discussion:**
   - **CPU Usage:** Graphical bars showing CPU usage per core.
   - **Tasks:** Number of processes and threads, with the count of running processes.
   - **Load Average:** System load averages for the past 1, 5, and 15 minutes.
   - **Uptime:** System uptime.
   - **Process List:**
     - **PID:** Process ID.
     - **USER:** Process owner.
     - **PRI:** Priority.
     - **NI:** Nice value.
     - **VIRT:** Virtual memory used.
     - **RES:** Resident memory used.
     - **SHR:** Shared memory used.
     - **S:** Process state (e.g., S = sleeping, R = running).
     - **CPU%:** CPU usage percentage.
     - **MEM%:** Memory usage percentage.
     - **TIME+:** Total CPU time used.
     - **Command:** Command name.

2. **Sort by CPU Usage:**
   ```sh
   htop
   ```
   - Press `F6`, then select `CPU%`.
   **Expected Output:**
   ```sh
   PID USER      PRI  NI  VIRT   RES   SHR S CPU% MEM%   TIME+  Command
   5678 user      20   0  600M   30M   10M S  2.0  0.3  0:02.00 another_process
   1234 root      20   0  500M   10M   5M  S  1.0  0.1  0:01.00 some_process
   ...
   ```
   **Discussion:**
   - Pressing `F6` allows you to sort processes by different criteria. Selecting `CPU%` sorts processes by CPU usage.

3. **Filter by Process Name:**
   ```sh
   htop
   ```
   - Press `F3`, then type the process name (e.g., `some_process`).
   **Expected Output:**
   ```sh
   PID USER      PRI  NI  VIRT   RES   SHR S CPU% MEM%   TIME+  Command
   1234 root      20   0  500M   10M   5M  S  1.0  0.1  0:01.00 some_process
   ...


   ```
   **Discussion:**
   - Pressing `F3` allows you to search for processes by name. Typing the process name filters the list to match the input.

4. **Kill a Process:**
   ```sh
   htop
   ```
   - Navigate to the process using the arrow keys, then press `F9` and select the signal (e.g., `15` for SIGTERM), then press `Enter`.
   **Expected Output:**
   ```sh
   No visible output; process is terminated.
   ```
   **Discussion:**
   - Pressing `F9` allows you to send a signal to terminate the selected process.

#### 3. `vmstat`

The `vmstat` (virtual memory statistics) command reports information about processes, memory, paging, block I/O, traps, and CPU activity.

**Basic Usage:**
```sh
vmstat [options] [delay [count]]
```

**Examples:**

1. **Basic `vmstat` Output:**
   ```sh
   vmstat
   ```
   **Expected Output:**
   ```sh
   procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
    r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
    1  0      0 800000 200000 500000    0    0     1     1   10   20  2  1 97  0  0
   ```
   **Discussion:**
   - **procs:** Process information.
     - **r:** Number of processes running.
     - **b:** Number of processes blocked.
   - **memory:** Memory information.
     - **swpd:** Amount of swap memory used.
     - **free:** Amount of free memory.
     - **buff:** Amount of memory used as buffers.
     - **cache:** Amount of memory used as cache.
   - **swap:** Swap information.
     - **si:** Amount of memory swapped in from disk.
     - **so:** Amount of memory swapped out to disk.
   - **io:** I/O information.
     - **bi:** Blocks received from a block device (blocks in).
     - **bo:** Blocks sent to a block device (blocks out).
   - **system:** System information.
     - **in:** Number of interrupts per second.
     - **cs:** Number of context switches per second.
   - **cpu:** CPU information.
     - **us:** User time (percentage of CPU used for user processes).
     - **sy:** System time (percentage of CPU used for system processes).
     - **id:** Idle time (percentage of CPU idle).
     - **wa:** Wait time (percentage of CPU waiting for I/O).
     - **st:** Stolen time (percentage of CPU stolen from a virtual machine).

2. **Continuous Monitoring:**
   ```sh
   vmstat 1 5
   ```
   **Expected Output:**
   ```sh
   procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
    r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
    1  0      0 800000 200000 500000    0    0     1     1   10   20  2  1 97  0  0
    0  0      0 799000 200000 500000    0    0     0     0    8   18  1  1 98  0  0
    0  0      0 798000 200000 500000    0    0     0     0    7   17  1  1 98  0  0
    1  0      0 797000 200000 500000    0    0     0     0    9   19  2  1 97  0  0
    0  0      0 796000 200000 500000    0    0     0     0    6   16  1  1 98  0  0
   ```
   **Discussion:**
   - The command `vmstat 1 5` prints system statistics every second for 5 seconds.
   - Useful for monitoring real-time system performance.

3. **Report Disk I/O Statistics:**
   ```sh
   vmstat -d
   ```
   **Expected Output:**
   ```sh
   disk0           1000    5000      1000   200000     50000
   ```
   **Discussion:**
   - **-d:** Displays disk I/O statistics.
   - **disk0:** Name of the disk.
   - **1000:** Number of reads.
   - **5000:** Number of writes.
   - **1000:** Number of I/O operations in progress.
   - **200000:** Number of kilobytes read.
   - **50000:** Number of kilobytes written.

4. **Report Slab Information:**
   ```sh
   vmstat -m
   ```
   **Expected Output:**
   ```sh
   Cache                       Num  Total   Size  Pages
   kmalloc-64                23816  23816     64    949
   kmalloc-128               15029  15029    128   2000
   kmalloc-256                1425   1425    256    195
   ...
   ```
   **Discussion:**
   - **-m:** Displays slab information.
   - **Cache:** Name of the slab cache.
   - **Num:** Number of currently allocated objects.
   - **Total:** Total number of available objects.
   - **Size:** Size of each object.
   - **Pages:** Number of pages allocated for the cache.

### Conclusion

By mastering `top`, `htop`, and `vmstat`, you can effectively monitor and manage system performance and processes. `top` and `htop` provide real-time, interactive views of system processes, while `vmstat` offers detailed statistics on memory, CPU, and I/O performance. Experiment with different commands and options to become proficient in these essential system monitoring tools. The provided outputs and discussions should give you a solid foundation for understanding these commands and their capabilities.