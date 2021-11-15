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
  set /a STARTTIME=(%STARTTIME:~0,2%) * 3600 + (1%STARTTIME:~3,2%-100) * 60 + (1%STARTTIME:~6,2%-100)  
  echo %STARTTIME%  
  rem the hour of the time does not have a leading 0.
  
  set /a total_time=%ENDTIMEime% - %STARTTIME%  
  echo total_time=%total_time%  
  
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
 
### Caculate the remainder in batch file
  set x=1  
  set /a remainder=%x% * 1000 %% 320 / 40  
  rem the result is 1  
  
### Caculate the remainder from commandline
  set x=1  
  set /a remainder=%x% * 1000 % 320 / 40  
  rem the result is 1   
  
