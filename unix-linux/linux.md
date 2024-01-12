### Linux project
	https://github.com/torvalds/linux
 
### 1. delete all .svn folder:
	first check:
	find . -name .svn -exec ls {} \;
	Then:
	find . -name .svn -exec rm -rf {} \;
	( {} expands to the filename of each file or directory found with find )
	( Semicolon ; ends the command executed by exec. It needs to be escaped with \ so that the shell you run find
	inside does not treat it as its own special character, but rather passes it to find. )
	
	or
	find . -name .svn | xargs rm -fr

### 2. Check if two files are the same:
	diff file1 file2
	No output means no difference

### 3. File/folder permissions
	The g=u argument from the chmod command makes the group permissions equal to the owner user 
	permissions, which by default are read and write. Use the g+rwX argument with the same results.

### 4. Check if Linux is 32-bit or 64-bit
	lscpu
	The “Architecture” entry tells you what type of CPU you have (where “x86_32” signifies 32-bit 
 	and “x86_64” signifies 64-bit)
  
### find os name and version in Linux:
	cat /etc/os-release
	lsb_release -a
	hostnamectl
 
### Check if server is physical or virtual
	sudo dmidecode -s system-manufacturer

 	If it is a physical system, you should see the name of the manufacturer like Dell, Lenovo etc.
	If it is a virtual system, you should see an output like QEMU, innotek Gmbh (for VirtualBox), 
 	OpenStack Foundation.

	sudo virt-what

  	If the server is running on a real, bare-metal system, it returns nothing. Otherwise, it will 
   	list some facts about the virtual machine, like kvm.
	
