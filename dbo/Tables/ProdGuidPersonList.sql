CREATE TABLE [dbo].[ProdGuidPersonList] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [GroupId]        INT           NOT NULL,
    [PersonalNumber] INT           NOT NULL,
    [Name]           VARCHAR (50)  NOT NULL,
    [SurName]        VARCHAR (100) NOT NULL,
    [UserId]         INT           NOT NULL,
    [Timestamp]      DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_ProdGuidPersonList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ProdGuidPersonList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_ProdGuidPersonList] UNIQUE NONCLUSTERED ([PersonalNumber] ASC)
);


GO

