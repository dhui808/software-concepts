### Milti-line command
^ is the eqvivalent of UNIX \ 

### Find the string length:
  See https://www.dostips.com/DtTipsStringManipulation.php
  
  set var=Hello World!  
  echo %var%> length.txt  
  for %%? in (length.txt) do ( set /a length=%%~z? - 2 )  
  echo %length%  
  del length.txt

### Find current time and convert it to seconds
  set STARTTIME=%TIME%  
  set /a STARTTIME=(1%STARTTIME:~0,2%-100) * 3600 + (1%STARTTIME:~3,2%-100) * 60 + (1%STARTTIME:~6,2%-100)  
  echo %STARTTIME%

### For-loop
  set volume=%1  
  set env=%2
  
  for /l %%a in (1, 1, %volume%) do (  
    call another.cmd %env%  
  )
  
### Check if a variable is empty
  set env=%1  
  
  rem strip the outer set of quotes  
  set env=%~1
  
  if "%env%" == "" echo env is empty  
  if NOT "%env%" == "" echo env is not empty  
