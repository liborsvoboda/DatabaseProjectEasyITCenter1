CREATE TABLE [dbo].[ServerToolTypeList] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Sequence]    INT           NOT NULL,
    [Name]        VARCHAR (50)  NOT NULL,
    [Description] TEXT          NULL,
    [UserId]      INT           NOT NULL,
    [TimeStamp]   DATETIME2 (7) CONSTRAINT [DF_ServerToolTypeList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ServerToolTypeList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ServerToolTypeList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_ServerToolTypeList] UNIQUE NONCLUSTERED ([Name] ASC)
);


GO

