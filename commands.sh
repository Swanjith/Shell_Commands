#!/bin/bash

# Hey there! So, you're looking to get a handle on some useful shell commands, huh?
# This script is basically a little cheat sheet I put together. It's got a mix of
# ones that you might find useful if you're  into CTFs (Capture The Flag competitions).
# No fancy stuff, just commands and what they do, explained in a pretty straightforward way.
# Hope it helps you out! Feel free to mess around with these in your terminal.

# --- BASICS FIRST: Everyday Shell Commands ---

# --- File System Navigation & Management ---

# ls - List directory contents
# cd - Change directory
# `cd ..` goes up one level.
# `cd ~` or just `cd` takes you to your home directory.
# pwd - Print working directory
# mkdir - Make directory
# rmdir - Remove directory
# rm - Remove files or directories
# cp - Copy files and directories (`cp source_file destination_file`)
# mv - Move or rename files and directories
# touch - Create an empty file or update timestamp
# find - Search for files in a directory hierarchy


# --- Text Processing --- 

# cat - Display file content
# less - View file content one page at a time
# head - Output the first part of files
# tail - Output the last part of files
# grep - Print lines matching a pattern
# awk - Pattern scanning and processing language
# sort - Sort lines of text files
# uniq - Report or omit repeated lines
# wc - Print newline, word, and byte counts for each file
# diff - Compare files line by line


# --- Process Management ---
#These is where,things get complicated..

# ps - Report a snapshot of the current processes
# `ps aux` is a common way to see all running processes.
# Example: ps
# Example: ps aux | grep "python"


# kill - Send a signal to a process (usually to terminate it)
# You need the Process ID (PID) from `ps`.
# `kill PID` sends a TERM signal (graceful shutdown).
# `kill -9 PID` or `kill -SIGKILL PID` is a forceful kill. Use with caution!
# Example: kill 12345

# jobs - List active jobs (background processes)


# --- Networking --- 

# ping - Checks if you can reach another machine on the network.
# ifconfig - Show IP addresses

# netstat / ss - Print network connections, routing tables, interface statistics
# `ss -tulnp` is a good one to see listening ports.
# Example: ss -tulnp

# curl / wget - Transfer data from or to a server
# `curl` is versatile for making web requests (GET, POST, etc.) and seeing the output.
# `wget` is great for downloading files from the web.
# Example (curl): curl https://api.example.com/data
# Example (wget): wget https://example.com/big_file.zip

# ssh - OpenSSH SSH client (remote login program)
# Securely connect to a remote machine.
#NOTE:You need a port number sometimes.
# Example: ssh username@remote_host_ip

# scp - Secure copy (remote file copy program)
# Copy files securely between machines using SSH.
# Example (local to remote): scp myfile.txt username@remote_host:/remote/dir/
# Example (remote to local): scp username@remote_host:/remote/file.txt ./local/dir/

# --- Permissions ---

# chmod - Change file mode bits (permissions)
# Controls who can read, write, or execute a file.
# `chmod +x script.sh` makes a script executable.

# chown - Change file owner and group
# Changes who owns a file.
# Example: sudo chown new_owner:new_group some_file.txt

# --- Archives & Compression ---

# tar -Creates or extracts .tar archives (tape archives).
# `tar -cvf file.tar /path/to/directory` (create)
# `tar -xvf file.tar` (extract)

# gzip / gunzip - Compress or expand files
# Compresses files into .gz format.

# --- User & System Info ---

# whoami - Tells you which user you're currently logged in as.
# man - Shows the manual page for a command.
# history - Display command history
# clear (ctrl+L)- Clear the terminal screen
# df - Report file system disk space usage
# `df -h` for human-readable sizes.
# Example: df -h

# --- Commands for Capture The Flag challenges(CTF) ---
# The bit more advanced commands for solving CTF

# --- CTF - General / Recon ---

# nmap - Network exploration tool/ port scanner
# `nmap -sV target_ip` tries to determine service versions,Here 'V' stands for version.
# `nmap -A target_ip` for aggressive scan (OS detection, version, script scanning, traceroute).

# strings - Print the printable strings from files
# Sometimes you find flags or interesting info hidden in binary files.
# Example: strings hidden_binary

# file - Determine file type
# Tells you what kind of file something is.
# Example: file unknown_data

# base64 - Base64 encode/decode data and print to standard output
# Just search it up in your browser you will get a lot of website which does this work.

# xxd - Make a hexdump or do the reverse.
# Good for looking at binary files in hex, or converting hex back to binary.
# Example: xxd binary_file
# Example: echo "48656c6c6f" | xxd -r -p # Hex to ASCII('-r' means reverse,'-p' means plain hexdump)

# --- CTF - Web Exploitation ---

# gobuster / dirb / ffuf - Directory and file bruteforcers
# These tools help find hidden directories and files on web servers by trying common names.
# Example (gobuster): gobuster dir -u http://target.site -w path_to_file

# sqlmap - Automatic SQL injection and database takeover tool
# Example: sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" --dbs

# --- CTF - Forensics ---

# foremost / scalpel - Recover files based on headers, footers, and data structures
# Useful for carving files out of disk images or data dumps.
# (Install separately: `sudo apt install foremost`)
# Example: foremost -i disk_image.dd -o output_directory/

# exiftool - Read and write meta information in files
# Images, documents, etc., can have hidden metadata. Exiftool reveals it.
# (Install separately: `sudo apt install libimage-exiftool-perl`)
# Example: exiftool suspicious_image.jpg

# binwalk - Firmware analysis tool (also good for finding embedded files)
# Can find and extract files hidden inside other files (like firmware images or JPEGs).
# (Install separately: `sudo apt install binwalk`)
# Example: binwalk -e some_file.dat # Try to extract embedded files

# steghide - Steganography tool, hides data in image/audio files
# If you suspect data is hidden in an image (steganography).
# (Install separately: `sudo apt install steghide`)
# Example: steghide extract -sf image_with_secret.jpg -p "password123"

# --- CTF - Reverse Engineering ---

# gdb - The GNU Debugger
# For debugging compiled programs, stepping through code, examining memory.
# Essential for reversing binaries.
# Example: gdb ./my_program
# (Inside gdb: `run`, `break main`, `next`, `print variable_name`, `info registers`)

# ltrace - Trace library calls of a program
# Shows you which library functions a program is calling.
# Example: ltrace ./some_binary

# strace - Trace system calls and signals
# Shows you the system calls a program makes. Very insightful.
# Example: strace ./another_binary

# objdump - Display information from object files
# Can disassemble code, show section headers, etc.
# `objdump -d ./binary` (disassemble executable sections)
# Example: objdump -M intel -D ./program_to_reverse

# radare2 / r2 - A free/libre toolchain for reverse engineering and binary analysis
# A very powerful and complex suite of tools for reversing. Has a steep learning curve.
# (Install separately)
# Example: r2 ./my_binary
# (Inside r2: `aaa` to analyze, `pdf @main` to print disassembly of main)

# --- CTF - Cryptography ---

# openssl - Command line tool for various cryptography tasks
# Can do a LOT: hashing, encryption/decryption (AES, DES, RSA), certificate management.
# I am not so well-versed with this one

# John the Ripper (john) / hashcat - Password cracking tools
# If you have password hashes, these tools can try to crack them.
# Example (john): john --wordlist=/usr/share/wordlists/rockyou.txt hashes.txt

# CyberChef - (Not a shell command, but a web app,google it!)
# Incredibly useful for all sorts of data manipulation: encoding/decoding, compression, crypto, etc.

# --- CTF - OSINT ---
# Learn about tools like 'sherlock','Maltego','Photon','ExifTool' etc...

# --- CTF - Binary Exploitation ---
# Please leave me out of this... 

# --- This the END for now!!---
# This isn't everything, of course. The shell is a vast and powerful place.
# The best way to learn is to practice. Open up a terminal and start trying these out.
# Use `man` command to learn more about any of them.



