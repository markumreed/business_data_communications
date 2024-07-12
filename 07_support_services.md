### Hands-On Tutorials for DNS Commands: `nslookup` and `dig`

#### 1. `nslookup`

The `nslookup` command is used to query Internet domain name servers. It can obtain domain name or IP address mapping and other DNS records.

**Basic Usage:**
```sh
nslookup [options] [domain]
```

**Examples:**

1. **Query an IP Address:**
   ```sh
   nslookup example.com
   ```
   **Expected Output:**
   ```sh
   Server:         8.8.8.8
   Address:        8.8.8.8#53

   Non-authoritative answer:
   Name:   example.com
   Address: 93.184.216.34
   ```
   **Discussion:**
   - **Server and Address:** Indicates the DNS server used for the query. In this case, it’s Google’s public DNS server (`8.8.8.8`).
   - **Non-authoritative answer:** This means the answer is not from the authoritative DNS server for `example.com`, but from a cached copy in the DNS server.
   - **Name and Address:** The queried domain `example.com` resolves to the IP address `93.184.216.34`.

2. **Query a Different DNS Server:**
   ```sh
   nslookup example.com 8.8.4.4
   ```
   **Expected Output:**
   ```sh
   Server:         8.8.4.4
   Address:        8.8.4.4#53

   Non-authoritative answer:
   Name:   example.com
   Address: 93.184.216.34
   ```
   **Discussion:**
   - This query specifies using `8.8.4.4` (another Google DNS server).
   - The output is similar to the previous example, showing the same IP address (`93.184.216.34`) for `example.com`, but using a different DNS server.

3. **Reverse DNS Lookup:**
   ```sh
   nslookup 93.184.216.34
   ```
   **Expected Output:**
   ```sh
   Server:         8.8.8.8
   Address:        8.8.8.8#53

   Non-authoritative answer:
   34.216.184.93.in-addr.arpa   name = example.com.
   ```
   **Discussion:**
   - **Reverse Lookup:** Queries the DNS for the domain name associated with an IP address.
   - The IP `93.184.216.34` resolves back to `example.com`.
   - **in-addr.arpa:** This is the domain used for reverse DNS lookups.

4. **Query for MX Records:**
   ```sh
   nslookup -query=mx example.com
   ```
   **Expected Output:**
   ```sh
   Server:         8.8.8.8
   Address:        8.8.8.8#53

   Non-authoritative answer:
   example.com    mail exchanger = 10 mail.example.com.
   ```
   **Discussion:**
   - **MX Record Query:** Retrieves mail exchange (MX) records, which specify the mail servers for the domain.
   - `mail exchanger = 10 mail.example.com.`: Indicates `mail.example.com` is the mail server for `example.com` with a priority of `10`.

#### 2. `dig`

The `dig` (Domain Information Groper) command is a powerful DNS lookup tool that provides detailed information about DNS queries.

**Basic Usage:**
```sh
dig [options] [domain]
```

**Examples:**

1. **Query an IP Address:**
   ```sh
   dig example.com
   ```
   **Expected Output:**
   ```sh
   ; <<>> DiG 9.11.3-1ubuntu1.13-Ubuntu <<>> example.com
   ;; global options: +cmd
   ;; Got answer:
   ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 12345
   ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 2, ADDITIONAL: 1

   ;; QUESTION SECTION:
   ;example.com.                   IN      A

   ;; ANSWER SECTION:
   example.com.            86400   IN      A       93.184.216.34

   ;; AUTHORITY SECTION:
   example.com.            86400   IN      NS      ns1.example.com.
   example.com.            86400   IN      NS      ns2.example.com.

   ;; ADDITIONAL SECTION:
   ns1.example.com.        86400   IN      A       192.0.2.1

   ;; Query time: 50 msec
   ;; SERVER: 8.8.8.8#53(8.8.8.8)
   ;; WHEN: Fri Jul  12 12:34:56 UTC 2024
   ;; MSG SIZE  rcvd: 123
   ```
   **Discussion:**
   - **HEADER:** Contains metadata about the query and response, such as status (`NOERROR`), flags (`qr rd ra`), and IDs.
   - **QUESTION SECTION:** The query made (`example.com` for A record).
   - **ANSWER SECTION:** Contains the answer to the query, showing `example.com` has an A record pointing to `93.184.216.34`.
   - **AUTHORITY SECTION:** Lists the authoritative DNS servers for `example.com`.
   - **ADDITIONAL SECTION:** Provides additional information, such as IP addresses of the authoritative DNS servers.
   - **Query time, SERVER, WHEN, MSG SIZE:** Provide performance metrics and context for the query.

2. **Query a Different DNS Server:**
   ```sh
   dig @8.8.4.4 example.com
   ```
   **Expected Output:**
   ```sh
   ; <<>> DiG 9.11.3-1ubuntu1.13-Ubuntu <<>> @8.8.4.4 example.com
   ; (1 server found)
   ;; global options: +cmd
   ;; Got answer:
   ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 12345
   ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 2, ADDITIONAL: 1

   ;; QUESTION SECTION:
   ;example.com.                   IN      A

   ;; ANSWER SECTION:
   example.com.            86400   IN      A       93.184.216.34

   ;; AUTHORITY SECTION:
   example.com.            86400   IN      NS      ns1.example.com.
   example.com.            86400   IN      NS      ns2.example.com.

   ;; ADDITIONAL SECTION:
   ns1.example.com.        86400   IN      A       192.0.2.1

   ;; Query time: 50 msec
   ;; SERVER: 8.8.4.4#53(8.8.4.4)
   ;; WHEN: Fri Jul  12 12:34:56 UTC 2024
   ;; MSG SIZE  rcvd: 123
   ```
   **Discussion:**
   - Uses `8.8.4.4` as the DNS server.
   - Similar detailed output as the previous example, showing the query results from a different DNS server.

3. **Query for MX Records:**
   ```sh
   dig example.com MX
   ```
   **Expected Output:**
   ```sh
   ; <<>> DiG 9.11.3-1ubuntu1.13-Ubuntu <<>> example.com MX
   ;; global options: +cmd
   ;; Got answer:
   ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 12345
   ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 2, ADDITIONAL: 1

   ;; QUESTION SECTION:
   ;example.com.                   IN      MX

   ;; ANSWER SECTION:
   example.com.            86400   IN      MX      10 mail.example.com.

   ;; AUTHORITY SECTION:
   example.com.            86400   IN      NS      ns1.example.com.
   example.com.            86400   IN      NS      ns2.example.com.

   ;; ADDITIONAL SECTION:
   mail.example.com.       86400   IN      A       192.0.2.2

   ;; Query time: 50 msec
   ;; SERVER: 8.8.8.8#53(8.8.8.8)
   ;; WHEN: Fri Jul  12 12:34:56 UTC 2024
   ;; MSG SIZE  rcvd: 123
   ```
   **Discussion:**
   - **QUESTION SECTION:** Indicates a query for MX records of `example.com`.
   - **ANSWER SECTION:** Shows the MX record for `example.com`, indicating `mail.example.com` as the mail server with a priority of `10`.
   - **AUTHORITY and ADDITIONAL SECTIONS:** Provide supporting information about DNS servers and additional A record for the mail server.

4. **Query for NS Records:**
   ```sh
   dig example.com NS
   ```
   **Expected Output:**
   ```sh
   ; <<>> DiG 9.11.3-1ubuntu1.13-Ubuntu <<>> example.com NS


   ;; global options: +cmd
   ;; Got answer:
   ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 12345
   ;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

   ;; QUESTION SECTION:
   ;example.com.                   IN      NS

   ;; ANSWER SECTION:
   example.com.            86400   IN      NS      ns1.example.com.
   example.com.            86400   IN      NS      ns2.example.com.

   ;; ADDITIONAL SECTION:
   ns1.example.com.        86400   IN      A       192.0.2.1

   ;; Query time: 50 msec
   ;; SERVER: 8.8.8.8#53(8.8.8.8)
   ;; WHEN: Fri Jul  12 12:34:56 UTC 2024
   ;; MSG SIZE  rcvd: 123
   ```
   **Discussion:**
   - **QUESTION SECTION:** Indicates a query for NS records of `example.com`.
   - **ANSWER SECTION:** Lists the authoritative name servers for `example.com` (`ns1.example.com` and `ns2.example.com`).
   - **ADDITIONAL SECTION:** Provides the IP address of `ns1.example.com`.

5. **Query for ANY Records:**
   ```sh
   dig example.com ANY
   ```
   **Expected Output:**
   ```sh
   ; <<>> DiG 9.11.3-1ubuntu1.13-Ubuntu <<>> example.com ANY
   ;; global options: +cmd
   ;; Got answer:
   ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 12345
   ;; flags: qr rd ra; QUERY: 1, ANSWER: 3, AUTHORITY: 2, ADDITIONAL: 3

   ;; QUESTION SECTION:
   ;example.com.                   IN      ANY

   ;; ANSWER SECTION:
   example.com.            86400   IN      A       93.184.216.34
   example.com.            86400   IN      NS      ns1.example.com.
   example.com.            86400   IN      NS      ns2.example.com.

   ;; AUTHORITY SECTION:
   example.com.            86400   IN      NS      ns1.example.com.
   example.com.            86400   IN      NS      ns2.example.com.

   ;; ADDITIONAL SECTION:
   ns1.example.com.        86400   IN      A       192.0.2.1
   ns2.example.com.        86400   IN      A       192.0.2.2

   ;; Query time: 50 msec
   ;; SERVER: 8.8.8.8#53(8.8.8.8)
   ;; WHEN: Fri Jul  12 12:34:56 UTC 2024
   ;; MSG SIZE  rcvd: 183
   ```
   **Discussion:**
   - **ANY Query:** Requests all available DNS records for the domain.
   - **ANSWER SECTION:** Contains multiple records, including A and NS records.
   - **AUTHORITY and ADDITIONAL SECTIONS:** Provide supporting information about DNS servers and their IP addresses.
   - This query type can return a comprehensive set of information, useful for a detailed overview of DNS settings for a domain.

### Conclusion

By mastering `nslookup` and `dig`, you can effectively perform DNS queries, troubleshoot domain name resolution issues, and obtain detailed DNS information. Experiment with different commands and options to become proficient in these essential DNS tools. The provided outputs and discussions should give you a solid foundation for understanding these commands and their capabilities.