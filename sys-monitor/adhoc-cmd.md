# Adhoc Commands

```bash
journalctl -u nginx --since "1 hour ago" -f

## WHAT's LISTENING ON THAT PORT
ss -tulnp | grep :443

## WHICH PROCESS IS HOGGING THE PORT
lsof -i :8080

## WATCH A HUNG PROCESS SYSCALL BY SYSCALL
strace -p PID

## CPU + mem + DISK
dstat -tam

```
