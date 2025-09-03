# Tools to monitor, debug and solve system 

> **vmstat** : reports information about processes, memory, paging, block I/O, traps, and CPU activity
> **iostat** : reports CPU and i/o statistics of the system
> **netstat** : displays statistical data related to TCP, UDP, IP, ICMP protocols
> **pidstat** : monitors the utilization of system resources by all or specificied processes , including CPU, memory, device IO, task switchin, threads, etc

| Area       | Tools  |
|------------|--------|
| Net device | tcpdump |
| IP | nstat |
| TCP/UDP    | nstat, tcplife, tcpretrans, udpconnect |
| Sockets    | ss |
| Network controller, port | nicstat, netstat, ip |
| I/O bridge | perf, tiptop |
| disk | blktrace, biotop, biolatency, |
| block device | iostat, biosnoop |
| volume manager | mdflush |
| file systems | ext4dist, ext4slower |
| VFS | lsof, fatrace, filelife, pcstat, opensnoop |
| Sys Call Interface | strace |
| system libraries | ltrace, gethostlatency |
| Virtual memory | vmstat, slabtop, free |
| device drivers to virtual memory interface | hardirqs, criticalstat |
| DRAM | numastat |
| DRAM to CPUs | tiptop, perf |
| CPUs | turbostat, showboost, rdmsr, profile |
| Scheduler | profile, execsnoop, mpstat, runqlen, offcputime, softirqs

> Miscellaneous: top, atop, ps, pidstat, sar, /proc, dmesg, dstat, Ftrace, BPFtrace, LTTng, BCC