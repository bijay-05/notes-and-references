# Troubleshoot 

## tcpdump

### Reference: [RedHat Blog](https://www.redhat.com/en/blog/introduction-using-tcpdump-linux-command-line)

```bash

$ sudo tcpdump --list-interfaces
$ sudo tcpdump -D    ## same as above

$ sudo tcpdump -i any -c 5  ## capture only 5 packets
$ sudo tcpdump -i eth0 -c 5

$ sudo tcpdump -i eth0 -c 5 icmp  ## filter based on protocol

$ sudo tcpdump -i eth0 -c 5 -nn host <ANOTHER_HOST_IP_ADDRESS>

## save to file capture.pcap and run in the background ( indicated by & )
$ sudo tcpdump -i eth0 -nn -c9 port 80 -w capture.pcap &

```

`tcpdump` by default resolves IP address and ports into names. But it is easier to debug issues with IP address and ports.
To disable IP address resolution user `-n` flag and `-nn` for port resolution.

`$ sudo tcpdump -i eth0 -c 5 -nn`


Limit capture to only packets related to a specific host by using the `host` filter

## TCP Flags

| Value  | Flag | Description        |
|-------:|:----:|:-------------------|
| S      |  SYN | Connection Start   |
| F      |  FIN | Connection Finish  |
| P      |  PUSH| Data Push          |
| R      |  RST | Connection Reset   |
| .      |  ACK | Acknowledgement    |
| DF     |  -   | Dont Fragment      |
