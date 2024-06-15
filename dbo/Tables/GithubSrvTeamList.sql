CREATE TABLE [dbo].[GithubSrvTeamList] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [Name]         VARCHAR (150) NULL,
    [Description]  TEXT          NULL,
    [CreationDate] DATETIME2 (7) NOT NULL,
    [TimeStamp]    DATETIME2 (7) CONSTRAINT [DF_GithubSrvTeamList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_GithubSrvTeamList] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

