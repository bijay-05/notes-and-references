# IPTABLES
Linux packet filtering system and firewall.


## CHAINS
Chains are set of rules that are applied to network packets as they follow through the linux kernel's netfilter framework. There are three default chains in iptables.

- **INPUT** : Applied to incoming packets that are destined for the host itself
- **FORWARD** : Packets that are being forwarded by the linux system to another device on the network -- packets that reach the host somehow but were not destined for the system.
- **OUTPUT** : Outgoing packets that originate from the system.

### Miscellaneous Chains

- **PREROUTING** : Applied to incoming packets before they are routed to the destination, and often used to modify the packet's destination IP address or ports. This chain comes before **INPUT** chain.
- **POSTROUTING** : Applied to outgoing packets after they are routed, and often used to modify the packet's source IP address or ports. This chain comes after **OUTPUT** chain.

## Examples

```bash
# block incoming traffic from specific IP address
## appends new rule to the end of the INPUT chain
$ sudo iptables -A INPUT -s 192.10.1.3 -j DROP

## drop all incoming traffic
$ sudo iptables -A INPUT -j DROP

## allow traffic on port 80,443 only
$ sudo iptables -A INPUT -p tcp -m multiport --dports 80,443 -j ACCEPT

# forward incoming traffic to another IP address
## forwards incoming traffic on TCP port 80 to private IP 192.168.1.10
$ sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.1.10:80

# block outgoing traffic to specific PORT
$ sudo iptables -A OUTPUT -p tcp --dport 25 -j DROP

```