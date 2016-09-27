DECLARE @name VARCHAR(50) -- database name  
DECLARE @path VARCHAR(256) -- path for backup files  
DECLARE @fileName VARCHAR(256) -- filename for backup  
DECLARE @fileDate VARCHAR(20) -- used for file name 

             
SET @path = 'C:\backup\'  


SELECT @fileDate = CONVERT(VARCHAR(8),GETDATE(),112) 

DECLARE db_cursor CURSOR FOR  
SELECT name 
FROM master.dbo.sysdatabases                                    
WHERE name NOT IN ('master','model','msdb','tempdb','renins20160408','renins20160407','rusal20160113','rusal20160324') 

OPEN db_cursor   
FETCH NEXT FROM db_cursor INTO @name   

WHILE @@FETCH_STATUS = 0   
BEGIN   
       SET @fileName = @path + @name + '_' + @fileDate + '.bak'  
       BACKUP DATABASE @name TO DISK = @fileName   

       FETCH NEXT FROM db_cursor INTO @name   
END   

CLOSE db_cursor   
DEALLOCATE db_cursor 
                                                
