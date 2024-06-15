
CREATE procedure [dbo].[SpGetTableDataList](@userRole varchar(255),@tableName varchar(255),@userId varchar(255) = null)
AS
BEGIN 
	DECLARE @Error VarChar(MAX);
	DECLARE @SqlCmd VarChar(100) = CONCAT('SELECT * FROM [dbo].[',@tableName,'] ORDER BY [Timestamp] DESC ');
	--DO PROCESS
	BEGIN TRY  
		
		DECLARE @AccessAllowed as Bit = 0;
		--CHECK ROLE RIGHT
		SET @AccessAllowed = ISNULL((SELECT 1 FROM [dbo].[SystemMenuList] as sml WHERE sml.FormPageName LIKE @tableName +'Page%'
		AND (sml.AccessRole LIKE @userRole + ',%' OR sml.AccessRole LIKE '%,' + @userRole + ',%' OR sml.AccessRole LIKE '%,' + @userRole)),0); 

		IF (@AccessAllowed = 1) BEGIN

			 EXEC (@SqlCmd);
			
		END
		-- PROCESS COMPLETED
	END TRY  
	BEGIN CATCH  
		SELECT @Error = CONCAT('SpGetTableDataList',' ,ErrNo:',CAST(ERROR_NUMBER() AS VARCHAR),' ,Message:',ERROR_MESSAGE()); 
		INSERT INTO [dbo].[SolutionFailList] ([Source],[Message]) VALUES('Database', @Error);
		-- PROCESS ERROR
		SELECT @Error as 'Data';
	END CATCH


END;

GO

