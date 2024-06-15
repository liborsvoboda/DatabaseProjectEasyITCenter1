CREATE TABLE [dbo].[SolutionUserList] (
    [Id]          INT             IDENTITY (1, 1) NOT NULL,
    [RoleId]      INT             NOT NULL,
    [UserName]    VARCHAR (150)   NOT NULL,
    [Password]    VARCHAR (2048)  NOT NULL,
    [Name]        VARCHAR (150)   NOT NULL,
    [SurName]     VARCHAR (150)   NOT NULL,
    [InfoEmail]   VARCHAR (255)   CONSTRAINT [DF_SolutionUserList_InfoEmail] DEFAULT ('email@address.com') NOT NULL,
    [Description] TEXT            NULL,
    [Active]      BIT             CONSTRAINT [DF_UserList_active] DEFAULT ((1)) NOT NULL,
    [Timestamp]   DATETIME2 (7)   CONSTRAINT [DF_userList_timestamp] DEFAULT (getdate()) NOT NULL,
    [Token]       VARCHAR (2048)  NULL,
    [Expiration]  DATETIME2 (7)   NULL,
    [Photo]       VARBINARY (MAX) NULL,
    [MimeType]    VARCHAR (100)   NULL,
    [PhotoPath]   VARCHAR (500)   NULL,
    CONSTRAINT [PK_username] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UserList_UserList] FOREIGN KEY ([Id]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [FK_UserList_UserRoleList] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[SolutionUserRoleList] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [IX_UserList] UNIQUE NONCLUSTERED ([UserName] ASC)
);


GO

CREATE   TRIGGER [dbo].[TR_UserList] ON dbo.SolutionUserList
FOR INSERT
AS
 
IF EXISTS (SELECT 0 FROM inserted)
BEGIN
	DECLARE @UserId int;

	SET NOCOUNT ON;

    IF EXISTS (SELECT 0 FROM deleted)
    BEGIN --UPDADE

		SELECT @UserId = ins.Id from inserted ins;

	END ELSE
		BEGIN -- INSERT

			SELECT @UserId = ins.Id from inserted ins;
			
			INSERT INTO [dbo].[SystemParameterList]([UserId],[SystemName],[Value],[Type],[Description])
			SELECT @UserId, pa.[SystemName],pa.[Value],pa.[Type],pa.[Description]
			FROM [dbo].[SystemParameterList] pa
			WHERE pa.UserId IS NULL;

		END
END /* ELSE 
BEGIN --DELETE
	SELECT @setActive = ins.[Active] from deleted ins;
	SELECT @RecId = ins.Id from deleted ins;
	SELECT @RecName = ins.[Name] from deleted ins;

	IF(@setActive = 1) BEGIN
		UPDATE [dbo].DocumentationList SET [Active] = 1 
		WHERE Id IN(SELECT TOP (1) MAX(d.Id) FROM [dbo].DocumentationList d WHERE d.Id <> @RecId AND d.[Name] = @RecName)
		;
	END
END
*/

GO

