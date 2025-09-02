# System Memory Monitoring

1. **pmap**
This command line tool reports memory map of a process.

> Your server is running out of memory but top shows nothing suspious. It could be due to hidden memory leak. 
> Try tracking RSS growth over time by running command

`pmap -x <PID> | tail -1`

> If RSS keeps increasing without bounds, you have found a memory leak. Automate it with

`while true; do pmap -x <PID> | tail -1; sleep 6-; done`
