CREATE TABLE [dbo].[GithubSrvSshKeyList] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [UserId]      INT            NOT NULL,
    [KeyType]     NVARCHAR (MAX) NULL,
    [Fingerprint] NVARCHAR (MAX) NULL,
    [PublicKey]   NVARCHAR (MAX) NULL,
    [ImportData]  DATETIME2 (7)  NOT NULL,
    [LastUse]     DATETIME2 (7)  NOT NULL,
    [TimeStamp]   DATETIME2 (7)  CONSTRAINT [DF_GithubSrvSshKeyList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_GithubSrvSshKeyList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GithubSrvSshKeyList_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]) ON DELETE CASCADE
);


GO

CREATE NONCLUSTERED INDEX [IX_GithubSrvSshKeyList_UserId]
    ON [dbo].[GithubSrvSshKeyList]([UserId] ASC);


GO

