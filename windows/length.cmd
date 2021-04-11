echo %1 > length.txt
for %%? in (length.txt) do ( set /a LENGTH=%%~z? - 2 )
del length.txt
rem use %LENGTH% to get the string length 
