CREATE TABLE [dbo].[BusinessPaymentMethodList] (
    [Id]                   INT           IDENTITY (1, 1) NOT NULL,
    [Name]                 VARCHAR (20)  NOT NULL,
    [Default]              BIT           NOT NULL,
    [Description]          TEXT          NULL,
    [AutoGenerateReceipt]  BIT           CONSTRAINT [DF_PaymentMethodList_AutoGenerateReceipt] DEFAULT ((0)) NOT NULL,
    [AllowGenerateReceipt] BIT           CONSTRAINT [DF_PaymentMethodList_AllowGenerateReceipt] DEFAULT ((0)) NOT NULL,
    [UserId]               INT           NOT NULL,
    [Active]               BIT           CONSTRAINT [DF_PaymentMethodList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]            DATETIME2 (7) CONSTRAINT [DF_PaymentMethodList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_PaymentMethodList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PaymentMethodList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_PaymentMethodList] UNIQUE NONCLUSTERED ([Name] ASC)
);


GO

CREATE   TRIGGER [dbo].[TR_PaymentMethodList] ON [dbo].[BusinessPaymentMethodList]
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
			UPDATE [dbo].BusinessPaymentMethodList SET [Default] = 0 WHERE Id <> @RecId; 		
		END
	END ELSE
		BEGIN -- INSERT
			SELECT @setDefault = ins.[Default] from inserted ins;
			SELECT @RecId = ins.Id from inserted ins;

			IF(@setDefault = 1) BEGIN
				UPDATE [dbo].BusinessPaymentMethodList SET [Default] = 0 WHERE Id <> @RecId; 		
			END
		
		END
END ELSE 
BEGIN --DELETE
	SELECT @setDefault = ins.[Default] from deleted ins;
	SELECT @RecId = ins.Id from deleted ins;

	IF(@setDefault = 1) BEGIN
		UPDATE [dbo].BusinessPaymentMethodList SET [Default] = 1  
		WHERE Id IN(SELECT TOP (1) Id FROM [dbo].BusinessPaymentMethodList WHERE Id <> @RecId)
		;
	END
END

GO

