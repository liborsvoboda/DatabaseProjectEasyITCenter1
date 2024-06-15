CREATE TABLE [dbo].[GithubSrvAuthLogList] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [IssueDate] DATETIME2 (7)  NOT NULL,
    [Expires]   DATETIME2 (7)  NOT NULL,
    [IssueIp]   NVARCHAR (MAX) NULL,
    [LastIp]    NVARCHAR (MAX) NULL,
    [IsValid]   BIT            NOT NULL,
    [UserId]    INT            NOT NULL,
    [TimeStamp] DATETIME2 (7)  CONSTRAINT [DF_GithubSrvAuthLogList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_GithubSrvAuthLogList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GithubSrvAuthLogList_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]) ON DELETE CASCADE
);


GO

CREATE NONCLUSTERED INDEX [IX_GithubSrvAuthLogList_UserId]
    ON [dbo].[GithubSrvAuthLogList]([UserId] ASC);


GO

