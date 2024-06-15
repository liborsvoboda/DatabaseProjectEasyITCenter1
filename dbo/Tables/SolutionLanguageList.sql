CREATE TABLE [dbo].[SolutionLanguageList] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [SystemName]  VARCHAR (50)  NOT NULL,
    [Description] TEXT          NULL,
    [UserId]      INT           NOT NULL,
    [TimeStamp]   DATETIME2 (7) CONSTRAINT [DF_ServerLanguageList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ServerLanguageList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ServerLanguageList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_ServerLanguageList] UNIQUE NONCLUSTERED ([SystemName] ASC)
);


GO

