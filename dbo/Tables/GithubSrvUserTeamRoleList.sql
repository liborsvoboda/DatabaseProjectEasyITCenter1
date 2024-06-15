CREATE TABLE [dbo].[GithubSrvUserTeamRoleList] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [TeamId]    INT           NOT NULL,
    [IsAdmin]   BIT           NOT NULL,
    [UserId]    INT           NOT NULL,
    [TimeStamp] DATETIME2 (7) CONSTRAINT [DF_GithubSrvUserTeamRoleList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_GithubSrvUserTeamRoleList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GithubSrvUserTeamRoleList_TeamId] FOREIGN KEY ([TeamId]) REFERENCES [dbo].[GithubSrvTeamList] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_GithubSrvUserTeamRoleList_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [IX_GithubSrvUserTeamRoleList] UNIQUE NONCLUSTERED ([TeamId] ASC, [UserId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_GithubSrvUserTeamRoleList_TeamId]
    ON [dbo].[GithubSrvUserTeamRoleList]([TeamId] ASC);


GO

