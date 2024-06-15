CREATE TABLE [dbo].[BasicCurrencyList] (
    [Id]           INT             IDENTITY (1, 1) NOT NULL,
    [Name]         VARCHAR (5)     NOT NULL,
    [ExchangeRate] NUMERIC (10, 2) CONSTRAINT [DF_CurrencyList_ExchangeRate] DEFAULT ((1)) NOT NULL,
    [Fixed]        BIT             CONSTRAINT [DF_CurrencyList_Fixed] DEFAULT ((1)) NOT NULL,
    [Description]  TEXT            NULL,
    [UserId]       INT             NOT NULL,
    [Active]       BIT             CONSTRAINT [DF_CurrencyList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]    DATETIME2 (7)   CONSTRAINT [DF_CurrencyList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    [Default]      BIT             CONSTRAINT [DF_CurrencyList_Default] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_CurrencyList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CurrencyList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id])
);


GO

CREATE   TRIGGER [dbo].[TR_CurrencyList] ON [dbo].[BasicCurrencyList]
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
			UPDATE [dbo].BasicCurrencyList SET [Default] = 0 WHERE Id <> @RecId; 		
		END
	END ELSE
		BEGIN -- INSERT
			SELECT @setDefault = ins.[Default] from inserted ins;
			SELECT @RecId = ins.Id from inserted ins;

			IF(@setDefault = 1) BEGIN
				UPDATE [dbo].BasicCurrencyList SET [Default] = 0 WHERE Id <> @RecId; 		
			END
		
		END
END ELSE 
BEGIN --DELETE
	SELECT @setDefault = ins.[Default] from deleted ins;
	SELECT @RecId = ins.Id from deleted ins;

	IF(@setDefault = 1) BEGIN
		UPDATE [dbo].BasicCurrencyList SET [Default] = 1  
		WHERE Id IN(SELECT TOP (1) Id FROM [dbo].BasicCurrencyList WHERE Id <> @RecId)
		;
	END
END

GO

