### Hands-On Tutorials for Routing Commands: `route`, `ip route`, and `traceroute`

#### 1. `route`

The `route` command is used to view and manipulate the IP routing table.

**Basic Usage:**
```sh
route [options]
```

**Examples:**

1. **View the Routing Table:**
   ```sh
   route
   ```
   **Expected Output:**
   ```sh
   Kernel IP routing table
   Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
   default         192.168.1.1     0.0.0.0         UG    100    0        0 eth0
   192.168.1.0     *               255.255.255.0   U     100    0        0 eth0
   ```
   **Discussion:**
   - **Destination:** Specifies the destination network or host. `default` indicates the default route for any packet not matching any other route.
   - **Gateway:** The IP address of the gateway to which packets should be sent. An asterisk (`*`) means there is no gateway for that route.
   - **Genmask:** The netmask for the destination. This indicates the size of the network portion of the destination address.
   - **Flags:**
     - `U` (Up): The route is up.
     - `G` (Gateway): The route uses a gateway.
     - `H` (Host): The route is to a host, not a network.
   - **Metric:** The cost of the route. Lower metrics are preferred.
   - **Iface:** The network interface to use for the route, such as `eth0`.

2. **Add a Route:**
   ```sh
   sudo route add -net 10.10.10.0 netmask 255.255.255.0 gw 192.168.1.1
   ```
   **Expected Output:**
   ```sh
   No output if successful.
   ```
   **Discussion:**
   - Adds a route to the network `10.10.10.0` with a netmask of `255.255.255.0` using `192.168.1.1` as the gateway.
   - The `-net` flag specifies that the destination is a network, not a host.

3. **Delete a Route:**
   ```sh
   sudo route del -net 10.10.10.0 netmask 255.255.255.0
   ```
   **Expected Output:**
   ```sh
   No output if successful.
   ```
   **Discussion:**
   - Removes the previously added route to the network `10.10.10.0`.

#### 2. `ip route`

The `ip route` command is part of the `ip` suite of tools for network management. It provides more advanced features than the traditional `route` command.

**Basic Usage:**
```sh
ip route [options]
```

**Examples:**

1. **View the Routing Table:**
   ```sh
   ip route
   ```
   **Expected Output:**
   ```sh
   default via 192.168.1.1 dev eth0 proto dhcp src 192.168.1.2 metric 100 
   192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.2 
   ```
   **Discussion:**
   - **default via 192.168.1.1:** Specifies the default route, using `192.168.1.1` as the gateway.
   - **dev eth0:** Indicates that this route uses the `eth0` network interface.
   - **proto dhcp:** Specifies that this route was configured via DHCP.
   - **src 192.168.1.2:** The source address used for outgoing packets.
   - **metric 100:** The route's cost metric.
   - **192.168.1.0/24:** Specifies a route to the network `192.168.1.0/24` (subnet mask `255.255.255.0`).
   - **proto kernel:** Indicates the route was added by the kernel.
   - **scope link:** Specifies that the route is directly connected.

2. **Add a Route:**
   ```sh
   sudo ip route add 10.10.10.0/24 via 192.168.1.1 dev eth0
   ```
   **Expected Output:**
   ```sh
   No output if successful.
   ```
   **Discussion:**
   - Adds a route to the `10.10.10.0/24` network via the gateway `192.168.1.1` using the `eth0` interface.
   - **via 192.168.1.1:** Specifies the gateway to use for the route.
   - **dev eth0:** Indicates the network interface to use.

3. **Delete a Route:**
   ```sh
   sudo ip route del 10.10.10.0/24
   ```
   **Expected Output:**
   ```sh
   No output if successful.
   ```
   **Discussion:**
   - Removes the previously added route to the `10.10.10.0/24` network.

4. **Change a Route:**
   ```sh
   sudo ip route change 10.10.10.0/24 via 192.168.1.2
   ```
   **Expected Output:**
   ```sh
   No output if successful.
   ```
   **Discussion:**
   - Changes the gateway for the route to `10.10.10.0/24` to `192.168.1.2`.

#### 3. `traceroute`

The `traceroute` command traces the route that packets take to a destination host.

**Basic Usage:**
```sh
traceroute [destination]
```

**Examples:**

1. **Trace Route to a Host:**
   ```sh
   traceroute google.com
   ```
   **Expected Output:**
   ```sh
   traceroute to google.com (142.250.64.78), 64 hops max
    1  192.168.1.1 (192.168.1.1)  1.132 ms  1.022 ms  1.045 ms
    2  10.0.0.1 (10.0.0.1)  9.234 ms  9.211 ms  9.193 ms
    3  172.16.0.1 (172.16.0.1)  19.324 ms  19.311 ms  19.298 ms
    ...
   ```
   **Discussion:**
   - **Hop Count (e.g., 1, 2, 3):** Represents the number of hops from the source to the destination. Each hop is typically a router or gateway.
   - **IP Address:** Displays the IP address of the router at each hop.
   - **Round-Trip Times (e.g., 1.132 ms, 1.022 ms):** Shows the time it takes for a packet to travel to the router and back, measured in milliseconds. Multiple times indicate multiple probe packets.
   - **traceroute to google.com (142.250.64.78), 64 hops max:** Indicates the destination and IP address being traced, with a maximum of 64 hops allowed.

2. **Specify the Number of Queries per Hop:**
   ```sh
   traceroute -q 2 google.com
   ```
   **Expected Output:**
   ```sh
   traceroute to google.com (142.250.64.78), 64 hops max
    1  192.168.1.1 (192.168.1.1)  1.132 ms  1.022 ms
    2  10.0.0.1 (10.0.0.1)  9.234 ms  9.211 ms
    3  172.16.0.1 (172.16.0.1)  19.324 ms  19.311 ms
    ...
   ```
   **Discussion:**
   - The `-q 2` option sets the number of probe packets sent per hop to 2 instead of the default 3. This can be useful to reduce the number of packets sent and decrease the output size.

3. **Specify Maximum Number of Hops:**
   ```sh
   traceroute -m 10 google.com
   ```
   **Expected Output:**
   ```sh
   traceroute to google.com (142.250.64.78), 10 hops max
    1  192.168.1.1 (192.168.1.1)  1.132 ms  1.022 ms  1.045 ms
    2  10.0.0.1 (10.0.0.1)  9.234 ms  9.211 ms  9.193 ms
    3  172.16.0.1 (172.16.0.1)  19.324 ms  19.311 ms  19.298 ms
    4  ...
   ```
   **Discussion:**
   - The `-m 10` option limits the maximum number of hops to 10. This can be useful if you know the destination is within a certain number of hops, to avoid unnecessary probing.

4. **Use ICMP ECHO

 for Probes:**
   ```sh
   traceroute -I google.com
   ```
   **Expected Output:**
   ```sh
   traceroute to google.com (142.250.64.78), 64 hops max
    1  192.168.1.1 (192.168.1.1)  1.132 ms  1.022 ms  1.045 ms
    2  10.0.0.1 (10.0.0.1)  9.234 ms  9.211 ms  9.193 ms
    3  172.16.0.1 (172.16.0.1)  19.324 ms  19.311 ms  19.298 ms
    ...
   ```
   **Discussion:**
   - The `-I` option uses ICMP ECHO packets (similar to ping) for probes instead of the default UDP packets. Some routers and firewalls handle ICMP differently from UDP, which can affect the results.

### Conclusion

By mastering `route`, `ip route`, and `traceroute`, you can effectively manage and troubleshoot network routes and understand the path packets take to reach their destination. Experiment with different commands and options to become proficient in these essential networking tools. The provided outputs and discussions should give you a solid foundation for understanding these commands and their capabilities.