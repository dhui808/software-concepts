#### 1. delete all .svn folder:
first check:
find . -name .svn -exec ls {} \;
Then:
find . -name .svn -exec rm -rf {} \;
( {} expands to the filename of each file or directory found with find )
( Semicolon ; ends the command executed by exec. It needs to be escaped with \ so that the shell you run find
inside does not treat it as its own special character, but rather passes it to find. )

or
find . -name .svn | xargs rm -fr

#### 2. Check if two files are the same:
diff file1 file2
No output means no difference

#### 3. File/folder permissions
The g=u argument from the chmod command makes the group permissions equal to the owner user 
permissions, which by default are read and write. Use the g+rwX argument with the same results.
