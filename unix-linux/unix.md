https://unix.stackexchange.com/questions/254711/history-of-unix-not-including-current-directory-in-path

### Bash
  -c string
  If the -c option is present, then commands are read from string. If there are arguments after the string, 
  they are assigned to the positional parameters, starting with $0.
  /bin/bash -c 'cat mya-container.yaml'
### How to fin which shell I am using?
  echo $0

### 2>&1
2>&1 redirects Standard Error (stderr) to Standard Output (stdout) so that both error messages and regular  
text flow into the same place. 

The Breakdown  
2: Represents Standard Error (stderr). This is where programs send error messages.  
>: The operator used for redirecting output.
&: A symbol that tells Linux the next number is a file descriptor (a stream), not a filename.
1: Represents Standard Output (stdout). This is where programs send normal, non-error text.
>
