postgre to mysql verilerin aktarimi
==================================
pgdump -h <host> -U <user> -p <port> <veritabaniadi>
--inserts
--column-inserts
--data-only
--no-privileges
--no-acl
-t tablo (bundan n tane olabilir tekrar tekrar)
--schema-only
--clear


mysqldump -h <host> -P <port> -u <user> -p <veritabaniadi> <tablolar> (boslukla ayirarak bor cok tablo verebiliyoruz)
--complete-insert 
--no-create-info
--no-create-db
--no-data
--add-drop-table

