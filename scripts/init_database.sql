###########################################################
/*Create Database and Schemas*/
###########################################################
/*Script Purpose:
    This script creates a new database named 'Datawarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
    within the database: 'bronze', 'silver', and 'gold'.
WARNING:
    Running this script will drop the entire 'Datawarehouse' database if it exists.
    All data in the database will be permanently deleted. Proceed with caution
    and ensure you have proper backups before running this script.
*/
use master;
go
  -- Drop and recreate the 'Data_Warehouse' database
if exists (select 1 from sys.databases where name = 'Data_Warehouse')
begin
    alter database Data_Warehouse set single_user with rollback immediate;
    drop database Data_Warehouse;
end;
go
create database Data_Warehouse;
use Data_Warehouse;
-- creating schemas
create schema bronze;
go
create schema silver;
go
create schema gold;
