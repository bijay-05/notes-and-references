# Network Monitoring

```bash
## Check if Specific Bridge is dropping packets
ip -s link show br-db531f2c2687

# View current tracked connections
sysctl net.netfilter.nf_conntrack_count

# View maximum allowed connections
sysctl net.netfilter.nf_conntrack_max
```
