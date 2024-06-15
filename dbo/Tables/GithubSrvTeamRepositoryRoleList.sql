CREATE TABLE [dbo].[GithubSrvTeamRepositoryRoleList] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [TeamId]       INT           NOT NULL,
    [RepositoryId] INT           NOT NULL,
    [AllowRead]    BIT           NOT NULL,
    [AllowWrite]   BIT           NOT NULL,
    [TimeStamp]    DATETIME2 (7) CONSTRAINT [DF_GithubSrvTeamRepositoryRoleList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_GithubSrvTeamRepositoryRoleList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GithubSrvTeamRepositoryRoleList_RepositoryId] FOREIGN KEY ([RepositoryId]) REFERENCES [dbo].[GithubSrvRepositoryList] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_GithubSrvTeamRepositoryRoleList_TeamId] FOREIGN KEY ([TeamId]) REFERENCES [dbo].[GithubSrvTeamList] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [IX_GithubSrvTeamRepositoryRoleList] UNIQUE NONCLUSTERED ([TeamId] ASC, [RepositoryId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_GithubSrvTeamRepositoryRoleList_RepositoryId]
    ON [dbo].[GithubSrvTeamRepositoryRoleList]([RepositoryId] ASC);


GO

