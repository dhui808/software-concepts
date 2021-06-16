https://unix.stackexchange.com/questions/254711/history-of-unix-not-including-current-directory-in-path

### Bash
  -c string
  If the -c option is present, then commands are read from string. If there are arguments after the string, 
  they are assigned to the positional parameters, starting with $0.
  /bin/bash -c 'cat mya-container.yaml'
### How to fin which shell I am using?
  echo $0
