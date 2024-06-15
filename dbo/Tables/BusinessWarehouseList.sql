CREATE TABLE [dbo].[BusinessWarehouseList] (
    [Id]                  INT           IDENTITY (1, 1) NOT NULL,
    [Name]                VARCHAR (50)  NOT NULL,
    [Description]         TEXT          NULL,
    [UserId]              INT           NOT NULL,
    [AllowNegativeStatus] BIT           NOT NULL,
    [Default]             BIT           NOT NULL,
    [LockedByStockTaking] BIT           CONSTRAINT [DF_WarehouseList_IsLocked] DEFAULT ((0)) NOT NULL,
    [LastStockTaking]     DATETIME2 (7) CONSTRAINT [DF_WarehouseList_LastStockTaking] DEFAULT (getdate()) NOT NULL,
    [Active]              BIT           CONSTRAINT [DF_WarehouseList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]           DATETIME2 (7) CONSTRAINT [DF_WarehouseList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WarehouseList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WarehouseList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_WarehouseList] UNIQUE NONCLUSTERED ([Name] ASC)
);


GO

CREATE   TRIGGER [dbo].[TR_WarehouseList] ON [dbo].[BusinessWarehouseList]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @Operation VARCHAR(15)
 
IF EXISTS (SELECT 0 FROM inserted)
BEGIN
	DECLARE @setDefault bit;DECLARE @RecId int;
	SET NOCOUNT ON;

    IF EXISTS (SELECT 0 FROM deleted)
    BEGIN --UPDADE
		SELECT @setDefault = ins.[Default] from inserted ins;
		SELECT @RecId = ins.Id from inserted ins;

		IF(@setDefault = 1) BEGIN
			UPDATE [dbo].BusinessWarehouseList SET [Default] = 0 WHERE Id <> @RecId; 		
		END
	END ELSE
		BEGIN -- INSERT
			SELECT @setDefault = ins.[Default] from inserted ins;
			SELECT @RecId = ins.Id from inserted ins;

			IF(@setDefault = 1) BEGIN
				UPDATE [dbo].BusinessWarehouseList SET [Default] = 0 WHERE Id <> @RecId; 		
			END
		
		END
END ELSE 
BEGIN --DELETE
	SELECT @setDefault = ins.[Default] from deleted ins;
	SELECT @RecId = ins.Id from deleted ins;

	IF(@setDefault = 1) BEGIN
		UPDATE [dbo].BusinessWarehouseList SET [Default] = 1  
		WHERE Id IN(SELECT TOP (1) Id FROM [dbo].BusinessWarehouseList WHERE Id <> @RecId)
		;
	END
END

GO

