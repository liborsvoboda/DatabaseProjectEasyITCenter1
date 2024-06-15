CREATE TABLE [dbo].[ProdGuidGroupList] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [Name]      VARCHAR (50)  NOT NULL,
    [UserId]    INT           NOT NULL,
    [Timestamp] DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_ProdGuidGroupList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ProdGuidGroupList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_ProdGuidGroupList] UNIQUE NONCLUSTERED ([Name] ASC)
);


GO

