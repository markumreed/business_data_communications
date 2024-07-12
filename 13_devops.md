### Hands-On Tutorials for `git`, `ansible`, and `jenkins`

#### 1. `git`

`git` is a distributed version control system used to track changes in source code during software development.

**Basic Usage:**
```sh
git [command] [options]
```

**Examples:**

1. **Initialize a New Git Repository:**
   ```sh
   git init my_project
   ```
   **Expected Output:**
   ```sh
   Initialized empty Git repository in /path/to/my_project/.git/
   ```
   **Discussion:**
   - **git init:** Initializes a new Git repository in the specified directory (`my_project`).

2. **Clone an Existing Repository:**
   ```sh
   git clone https://github.com/example/repo.git
   ```
   **Expected Output:**
   ```sh
   Cloning into 'repo'...
   remote: Enumerating objects: 10, done.
   remote: Counting objects: 100% (10/10), done.
   remote: Compressing objects: 100% (10/10), done.
   Receiving objects: 100% (10/10), done.
   ```
   **Discussion:**
   - **git clone:** Clones an existing repository from the specified URL to your local machine.

3. **Check the Status of Your Repository:**
   ```sh
   git status
   ```
   **Expected Output:**
   ```sh
   On branch main
   Your branch is up to date with 'origin/main'.

   Untracked files:
     (use "git add <file>..." to include in what will be committed)
     newfile.txt
   ```
   **Discussion:**
   - **git status:** Displays the state of the working directory and the staging area, showing which changes have been staged, which haven’t, and which files aren’t being tracked by Git.

4. **Add Files to the Staging Area:**
   ```sh
   git add newfile.txt
   ```
   **Expected Output:**
   ```sh
   No output if successful.
   ```
   **Discussion:**
   - **git add:** Adds changes in the specified file (`newfile.txt`) to the staging area.

5. **Commit Changes:**
   ```sh
   git commit -m "Add newfile.txt"
   ```
   **Expected Output:**
   ```sh
   [main d1e8f4c] Add newfile.txt
   1 file changed, 1 insertion(+)
   create mode 100644 newfile.txt
   ```
   **Discussion:**
   - **git commit:** Records changes to the repository with a descriptive message.

6. **Push Changes to a Remote Repository:**
   ```sh
   git push origin main
   ```
   **Expected Output:**
   ```sh
   Enumerating objects: 5, done.
   Counting objects: 100% (5/5), done.
   Writing objects: 100% (3/3), 300 bytes | 300.00 KiB/s, done.
   Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
   To https://github.com/example/repo.git
    * [new branch]      main -> main
   ```
   **Discussion:**
   - **git push:** Pushes commits from your local repository to the remote repository (`origin`) on the specified branch (`main`).

7. **Pull Changes from a Remote Repository:**
   ```sh
   git pull origin main
   ```
   **Expected Output:**
   ```sh
   From https://github.com/example/repo
    * branch            main       -> FETCH_HEAD
   Updating d1e8f4c..e5d9f3a
   Fast-forward
    anotherfile.txt | 1 +
    1 file changed, 1 insertion(+)
   ```
   **Discussion:**
   - **git pull:** Fetches and merges changes from the remote repository to your local branch.

#### 2. `ansible`

`ansible` is an open-source automation tool used for configuration management, application deployment, and task automation.

**Basic Usage:**
```sh
ansible [options] <pattern> [module] [args]
```

**Examples:**

1. **Check Connectivity with Ping Module:**
   ```sh
   ansible all -m ping
   ```
   **Expected Output:**
   ```sh
   server1 | SUCCESS => {
       "changed": false,
       "ping": "pong"
   }
   server2 | SUCCESS => {
       "changed": false,
       "ping": "pong"
   }
   ```
   **Discussion:**
   - **ansible all -m ping:** Uses the `ping` module to check connectivity to all hosts in the inventory.

2. **Run a Command on All Hosts:**
   ```sh
   ansible all -m command -a "uptime"
   ```
   **Expected Output:**
   ```sh
   server1 | CHANGED | rc=0 >>
    12:34:56 up 1:23,  1 user,  load average: 0.01, 0.05, 0.10
   server2 | CHANGED | rc=0 >>
    12:34:56 up 1:23,  1 user,  load average: 0.00, 0.04, 0.09
   ```
   **Discussion:**
   - **ansible all -m command -a "uptime":** Runs the `uptime` command on all hosts in the inventory using the `command` module.

3. **Copy a File to All Hosts:**
   ```sh
   ansible all -m copy -a "src=/local/path dest=/remote/path"
   ```
   **Expected Output:**
   ```sh
   server1 | CHANGED => {
       "changed": true,
       "checksum": "d41d8cd98f00b204e9800998ecf8427e",
       "dest": "/remote/path",
       "gid": 0,
       "group": "root",
       "mode": "0644",
       "owner": "root",
       "size": 0,
       "src": "/local/path"
   }
   server2 | CHANGED => {
       "changed": true,
       "checksum": "d41d8cd98f00b204e9800998ecf8427e",
       "dest": "/remote/path",
       "gid": 0,
       "group": "root",
       "mode": "0644",
       "owner": "root",
       "size": 0,
       "src": "/local/path"
   }
   ```
   **Discussion:**
   - **ansible all -m copy -a "src=/local/path dest=/remote/path":** Copies a file from the local machine to the specified path on all hosts in the inventory using the `copy` module.

4. **Install a Package on All Hosts:**
   ```sh
   ansible all -m apt -a "name=nginx state=present" --become
   ```
   **Expected Output:**
   ```sh
   server1 | CHANGED => {
       "changed": true,
       "cache_updated": false,
       "stderr": "",
       "stderr_lines": [],
       "stdout": "Reading package lists...\nBuilding dependency tree...\nReading state information...\nThe following additional packages will be installed:\n  nginx-common nginx-core\nSuggested packages:\n  fcgiwrap nginx-doc\nThe following NEW packages will be installed:\n  nginx nginx-common nginx-core\n0 upgraded, 3 newly installed, 0 to remove and 0 not upgraded.\nNeed to get 579 kB of archives.\nAfter this operation, 1824 kB of additional disk space will be used.\nGet:1 http://archive.ubuntu.com/ubuntu focal/universe amd64 nginx-common all 1.18.0-0ubuntu1 [37.4 kB]\nGet:2 http://archive.ubuntu.com/ubuntu focal/universe amd64 nginx-core amd64 1.18.0-0ubuntu1 [538 kB]\nGet:3 http://archive.ubuntu.com/ubuntu focal/universe amd64 nginx amd64 1.18.0-0ubuntu1 [4,280 B]\nFetched 579 kB in 1s (1,066 kB/s)\nPreconfiguring packages ...\nSelecting previously unselected package nginx-common.\n(Reading database ... 244500 files and directories currently installed.)\nPreparing to unpack .../nginx-common_1.18.0-0ubuntu1_all.deb ...\nUnpacking nginx-common (1.18.0-0ubuntu1) ...\nSelecting previously unselected package nginx-core.\nPreparing to unpack .../nginx-core_1.18.0-0ubuntu1_amd64.deb ...\nUnpacking nginx-core (1.18.0-0ubuntu1) ...\nSelecting previously unselected package nginx.\nPreparing to unpack .../nginx_1.18.0-0ubuntu1_amd64.deb ...\nUnpacking nginx (1.18.0-0ubuntu1) ...\nSetting up nginx-common (1.18.0-0ubuntu1) ...\nSetting up nginx-core (1.18.0-0ubuntu1) ...\nSetting up nginx (1.18.0-0ubuntu1) ...\nProcessing triggers for man-db (2.9.1-1) ...\nProcessing triggers for systemd (245.4-4

ubuntu3.4) ...\nProcessing triggers for ufw (0.36-6ubuntu1) ...\nProcessing triggers for mime-support (3.64ubuntu1) ...\nProcessing triggers for hicolor-icon-theme (0.17-2) ...\nProcessing triggers for shared-mime-info (1.15-1) ...\nProcessing triggers for libc-bin (2.31-0ubuntu9.2) ...\nProcessing triggers for install-info (6.7.0.dfsg.2-5build2) ...\nProcessing triggers for initramfs-tools (0.136ubuntu6.3) ...\nProcessing triggers for update-notifier-common (3.192.30.10) ...\nProcessing triggers for gnome-menus (3.36.0-1ubuntu1) ...\n"
   }
   server2 | CHANGED => {
       "changed": true,
       "cache_updated": false,
       "stderr": "",
       "stderr_lines": [],
       "stdout": "Reading package lists...\nBuilding dependency tree...\nReading state information...\nThe following additional packages will be installed:\n  nginx-common nginx-core\nSuggested packages:\n  fcgiwrap nginx-doc\nThe following NEW packages will be installed:\n  nginx nginx-common nginx-core\n0 upgraded, 3 newly installed, 0 to remove and 0 not upgraded.\nNeed to get 579 kB of archives.\nAfter this operation, 1824 kB of additional disk space will be used.\nGet:1 http://archive.ubuntu.com/ubuntu focal/universe amd64 nginx-common all 1.18.0-0ubuntu1 [37.4 kB]\nGet:2 http://archive.ubuntu.com/ubuntu focal/universe amd64 nginx-core amd64 1.18.0-0ubuntu1 [538 kB]\nGet:3 http://archive.ubuntu.com/ubuntu focal/universe amd64 nginx amd64 1.18.0-0ubuntu1 [4,280 B]\nFetched 579 kB in 1s (1,066 kB/s)\nPreconfiguring packages ...\nSelecting previously unselected package nginx-common.\n(Reading database ... 244500 files and directories currently installed.)\nPreparing to unpack .../nginx-common_1.18.0-0ubuntu1_all.deb ...\nUnpacking nginx-common (1.18.0-0ubuntu1) ...\nSelecting previously unselected package nginx-core.\nPreparing to unpack .../nginx-core_1.18.0-0ubuntu1_amd64.deb ...\nUnpacking nginx-core (1.18.0-0ubuntu1) ...\nSelecting previously unselected package nginx.\nPreparing to unpack .../nginx_1.18.0-0ubuntu1_amd64.deb ...\nUnpacking nginx (1.18.0-0ubuntu1) ...\nSetting up nginx-common (1.18.0-0ubuntu1) ...\nSetting up nginx-core (1.18.0-0ubuntu1) ...\nSetting up nginx (1.18.0-0ubuntu1) ...\nProcessing triggers for man-db (2.9.1-1) ...\nProcessing triggers for systemd (245.4-4ubuntu3.4) ...\nProcessing triggers for ufw (0.36-6ubuntu1) ...\nProcessing triggers for mime-support (3.64ubuntu1) ...\nProcessing triggers for hicolor-icon-theme (0.17-2) ...\nProcessing triggers for shared-mime-info (1.15-1) ...\nProcessing triggers for libc-bin (2.31-0ubuntu9.2) ...\nProcessing triggers for install-info (6.7.0.dfsg.2-5build2) ...\nProcessing triggers for initramfs-tools (0.136ubuntu6.3) ...\nProcessing triggers for update-notifier-common (3.192.30.10) ...\nProcessing triggers for gnome-menus (3.36.0-1ubuntu1) ...\n"
   }
   ```
   **Discussion:**
   - **ansible all -m apt -a "name=nginx state=present" --become:** Installs the `nginx` package on all hosts in the inventory using the `apt` module and elevates privileges using `--become`.

#### 3. `jenkins`

`jenkins` is an open-source automation server that helps automate parts of software development related to building, testing, and deploying.

**Basic Usage:**
- Jenkins is typically managed through a web interface, but some tasks can be performed via the CLI.

**Examples:**

1. **Access Jenkins Web Interface:**
   - **URL:** http://localhost:8080 (replace `localhost` with your server's address)
   **Expected Output:**
   - A web interface prompting for login or initial setup if it's the first run.
   **Discussion:**
   - Accessing Jenkins via a web browser provides a graphical interface to manage and configure Jenkins jobs, plugins, and settings.

2. **Create a New Job:**
   - Navigate to Jenkins Dashboard > New Item
   - Enter a name for the job, select "Freestyle project," and click "OK."
   **Expected Output:**
   - A new job configuration page.
   **Discussion:**
   - This page allows you to configure various aspects of the job, such as the source code repository, build triggers, and build steps.

3. **Configure a Job to Build from Git:**
   - In the job configuration page, under "Source Code Management," select "Git."
   - Enter the repository URL (e.g., `https://github.com/example/repo.git`).
   - Optionally, configure additional options like branches to build.
   **Expected Output:**
   - Configured job with Git repository settings.
   **Discussion:**
   - This configuration tells Jenkins to pull the source code from the specified Git repository for building.

4. **Add Build Steps:**
   - In the job configuration page, under "Build," click "Add build step" and select "Execute shell."
   - Enter the shell commands to build your project (e.g., `./build.sh`).
   **Expected Output:**
   - Configured build step with shell commands.
   **Discussion:**
   - This setup specifies the commands Jenkins will execute to build your project.

5. **Run a Job Manually:**
   - Navigate to the job page and click "Build Now."
   **Expected Output:**
   - A new build appears in the build history with a progress indicator.
   **Discussion:**
   - This action triggers the job to run immediately. You can monitor the build progress and view the console output.

6. **View Build Results:**
   - Click on the build number in the build history to view details.
   - Navigate to "Console Output" to see the log of the build.
   **Expected Output:**
   - Detailed build log showing the output of the build process.
   **Discussion:**
   - Reviewing the console output helps in diagnosing issues and verifying that the build steps executed as expected.

### Conclusion

By mastering `git`, `ansible`, and `jenkins`, you can effectively manage source code, automate configuration and deployment tasks, and streamline the software development process. Experiment with different commands and options to become proficient in these essential tools. The provided outputs and discussions should give you a solid foundation for understanding these commands and their capabilities.