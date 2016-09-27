sqlcmd -S (local) -U sa -P p@ssw0rd -i script.sql
7z a -tzip C:\backup\%DATE:~-4%%DATE:~4,2%%DATE:~7,2%_%ComputerName%_bak.zip -i!C:\backup\*.bak                    

del C:\backup\*.bak 

ftp -s:ftp.txt -nd
del C:\backup\*.zip