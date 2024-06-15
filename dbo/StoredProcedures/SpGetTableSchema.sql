




CREATE procedure [dbo].[SpGetTableSchema](@tableName varchar(255))
AS
BEGIN 
	
	SELECT COLUMN_NAME as 'Data'
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME= @tableName

END;

GO

