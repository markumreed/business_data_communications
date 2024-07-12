### Hands-On Tutorials for `ping` and `mtr`

#### 1. `ping`

The `ping` command is used to test the reachability of a host on a network and to measure the round-trip time for messages sent from the originating host to a destination computer.

**Basic Usage:**
```sh
ping [options] destination
```

**Examples:**

1. **Ping a Host:**
   ```sh
   ping google.com
   ```
   **Expected Output:**
   ```sh
   PING google.com (142.250.64.78) 56(84) bytes of data.
   64 bytes from ord37s29-in-f14.1e100.net (142.250.64.78): icmp_seq=1 ttl=115 time=14.8 ms
   64 bytes from ord37s29-in-f14.1e100.net (142.250.64.78): icmp_seq=2 ttl=115 time=15.2 ms
   64 bytes from ord37s29-in-f14.1e100.net (142.250.64.78): icmp_seq=3 ttl=115 time=14.9 ms

   --- google.com ping statistics ---
   3 packets transmitted, 3 received, 0% packet loss, time 2002ms
   rtt min/avg/max/mdev = 14.805/14.979/15.237/0.186 ms
   ```
   **Discussion:**
   - **PING google.com (142.250.64.78):** Indicates the IP address of `google.com` and the packet size being sent (56 bytes of data plus 28 bytes of ICMP header, totaling 84 bytes).
   - **64 bytes from ord37s29-in-f14.1e100.net (142.250.64.78):** Each line represents a response from the destination. It shows the packet size (64 bytes), the host responding (`ord37s29-in-f14.1e100.net`), and the IP address (`142.250.64.78`).
     - **icmp_seq=1:** The sequence number of the ICMP request. Helps track packets and measure loss.
     - **ttl=115:** The time-to-live value, which decrements by one for each hop. It helps avoid routing loops.
     - **time=14.8 ms:** The round-trip time for the packet in milliseconds. Indicates the latency between the source and destination.
   - **--- google.com ping statistics ---:** A summary of the ping results.
     - **3 packets transmitted, 3 received, 0% packet loss:** Indicates that all packets sent were received back, showing no packet loss.
     - **rtt min/avg/max/mdev = 14.805/14.979/15.237/0.186 ms:** Displays the minimum, average, maximum, and mean deviation of the round-trip times, giving a sense of the latency consistency.

2. **Specify Number of Pings:**
   ```sh
   ping -c 4 google.com
   ```
   **Expected Output:**
   ```sh
   PING google.com (142.250.64.78) 56(84) bytes of data.
   64 bytes from ord37s29-in-f14.1e100.net (142.250.64.78): icmp_seq=1 ttl=115 time=14.8 ms
   64 bytes from ord37s29-in-f14.1e100.net (142.250.64.78): icmp_seq=2 ttl=115 time=15.2 ms
   64 bytes from ord37s29-in-f14.1e100.net (142.250.64.78): icmp_seq=3 ttl=115 time=14.9 ms
   64 bytes from ord37s29-in-f14.1e100.net (142.250.64.78): icmp_seq=4 ttl=115 time=15.1 ms

   --- google.com ping statistics ---
   4 packets transmitted, 4 received, 0% packet loss, time 4002ms
   rtt min/avg/max/mdev = 14.805/14.979/15.237/0.186 ms
   ```
   **Discussion:**
   - The `-c 4` option limits the number of ping requests to 4. This helps in quickly testing connectivity without continuous pinging.
   - The output shows 4 ICMP requests and responses, with each having similar sequence numbers, TTL values, and round-trip times.
   - The statistics at the end summarize the results, confirming that all 4 packets were successfully received.

3. **Specify Packet Size:**
   ```sh
   ping -s 100 google.com
   ```
   **Expected Output:**
   ```sh
   PING google.com (142.250.64.78) 100(128) bytes of data.
   108 bytes from ord37s29-in-f14.1e100.net (142.250.64.78): icmp_seq=1 ttl=115 time=14.8 ms
   108 bytes from ord37s29-in-f14.1e100.net (142.250.64.78): icmp_seq=2 ttl=115 time=15.2 ms
   108 bytes from ord37s29-in-f14.1e100.net (142.250.64.78): icmp_seq=3 ttl=115 time=14.9 ms

   --- google.com ping statistics ---
   3 packets transmitted, 3 received, 0% packet loss, time 2002ms
   rtt min/avg/max/mdev = 14.805/14.979/15.237/0.186 ms
   ```
   **Discussion:**
   - The `-s 100` option sets the ICMP payload size to 100 bytes. This results in a total packet size of 128 bytes (100 bytes data + 28 bytes header).
   - Each response now shows 108 bytes received (100 bytes data + 8 bytes ICMP header).
   - The statistics summary confirms no packet loss and similar round-trip times as smaller packets.

4. **Ping a Host Until Stopped:**
   ```sh
   ping google.com
   ```
   **Expected Output:**
   ```sh
   PING google.com (142.250.64.78) 56(84) bytes of data.
   64 bytes from ord37s29-in-f14.1e100.net (142.250.64.78): icmp_seq=1 ttl=115 time=14.8 ms
   64 bytes from ord37s29-in-f14.1e100.net (142.250.64.78): icmp_seq=2 ttl=115 time=15.2 ms
   64 bytes from ord37s29-in-f14.1e100.net (142.250.64.78): icmp_seq=3 ttl=115 time=14.9 ms
   ...
   ```
   **Discussion:**
   - By default, `ping` continues to send requests until it is manually stopped (usually with `Ctrl+C`).
   - Useful for continuous monitoring to see if there are intermittent connectivity issues.
   - When stopped, `ping` will provide a summary of the ping statistics similar to the ones shown in previous examples.

#### 2. `mtr`

The `mtr` (My Traceroute) command combines the functionality of the `ping` and `traceroute` commands. It provides real-time statistics about the network path to a destination.

**Basic Usage:**
```sh
mtr [options] destination
```

**Examples:**

1. **Run `mtr` to a Host:**
   ```sh
   mtr google.com
   ```
   **Expected Output:**
   ```sh
   Start: 2024-07-12T12:34:56+0000
   HOST: myhost.local             Loss%   Snt   Last   Avg  Best  Wrst StDev
   1. 192.168.1.1                 0.0%    10    1.1    1.2   1.0   2.3  0.2
   2. 10.0.0.1                    0.0%    10    9.2    9.4   9.1  10.1  0.3
   3. 172.16.0.1                  0.0%    10   19.3   19.5  19.3  20.0  0.2
   4. ...
   ```
   **Discussion:**
   - **HOST:** Lists the hops along the path to the destination. Each line shows a hop, with the hostname or IP address.
   - **Loss%:** Packet loss percentage at each hop. A value of `0.0%` indicates no packet loss.
   - **Snt:** Number of packets sent to each hop.
   - **Last:** The round-trip time of the last packet sent to the hop.
   - **Avg:** The average round-trip time for all packets sent to the hop.
   - **Best:** The lowest round-trip time recorded.
   - **Wrst:** The highest round-trip time recorded.
   - **StDev:** The standard deviation of the round-trip times, indicating variability in latency.

2. **Run `mtr` with a Limited Number of Packets:**
   ```sh
   mtr

 -c 10 google.com
   ```
   **Expected Output:**
   ```sh
   Start: 2024-07-12T12:34:56+0000
   HOST: myhost.local             Loss%   Snt   Last   Avg  Best  Wrst StDev
   1. 192.168.1.1                 0.0%    10    1.1    1.2   1.0   2.3  0.2
   2. 10.0.0.1                    0.0%    10    9.2    9.4   9.1  10.1  0.3
   3. 172.16.0.1                  0.0%    10   19.3   19.5  19.3  20.0  0.2
   4. ...
   ```
   **Discussion:**
   - The `-c 10` option limits `mtr` to sending 10 packets to each hop.
   - The output provides a fixed sample size, making it easier to analyze and compare results.

3. **Run `mtr` in Report Mode:**
   ```sh
   mtr -r google.com
   ```
   **Expected Output:**
   ```sh
   Start: 2024-07-12T12:34:56+0000
   HOST: myhost.local             Loss%   Snt   Last   Avg  Best  Wrst StDev
   1. 192.168.1.1                 0.0%    10    1.1    1.2   1.0   2.3  0.2
   2. 10.0.0.1                    0.0%    10    9.2    9.4   9.1  10.1  0.3
   3. 172.16.0.1                  0.0%    10   19.3   19.5  19.3  20.0  0.2
   4. ...
   ```
   **Discussion:**
   - The `-r` option runs `mtr` in report mode, providing a one-time summary of results instead of continuous real-time updates.
   - This is useful for generating a snapshot of network performance that can be saved or shared.

4. **Run `mtr` with JSON Output:**
   ```sh
   mtr -j google.com
   ```
   **Expected Output:**
   ```json
   {
     "report": {
       "start": "2024-07-12T12:34:56+0000",
       "host": "myhost.local",
       "hubs": [
         {"host": "192.168.1.1", "Loss%": "0.0%", "Snt": 10, "Last": 1.1, "Avg": 1.2, "Best": 1.0, "Wrst": 2.3, "StDev": 0.2},
         {"host": "10.0.0.1", "Loss%": "0.0%", "Snt": 10, "Last": 9.2, "Avg": 9.4, "Best": 9.1, "Wrst": 10.1, "StDev": 0.3},
         {"host": "172.16.0.1", "Loss%": "0.0%", "Snt": 10, "Last": 19.3, "Avg": 19.5, "Best": 19.3, "Wrst": 20.0, "StDev": 0.2}
         ...
       ]
     }
   }
   ```
   **Discussion:**
   - The `-j` option generates JSON formatted output, making it easier to integrate `mtr` results into scripts or tools that process JSON data.
   - The JSON output provides structured data, including each hop's statistics, which can be used for detailed analysis or automated monitoring.

### Conclusion

By mastering `ping` and `mtr`, you can effectively diagnose and troubleshoot network connectivity and performance issues. `ping` provides basic reachability tests and round-trip time measurements, while `mtr` offers a more detailed, real-time view of the network path to a destination. Experiment with different commands and options to become proficient in these essential networking tools. The provided outputs and discussions should give you a solid foundation for understanding these commands and their capabilities.