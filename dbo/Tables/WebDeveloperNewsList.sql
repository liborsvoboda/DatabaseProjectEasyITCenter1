CREATE TABLE [dbo].[WebDeveloperNewsList] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Title]       VARCHAR (50)  NOT NULL,
    [Description] TEXT          NULL,
    [UserId]      INT           NOT NULL,
    [Active]      BIT           CONSTRAINT [DF_WebDeveloperNewsList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]   DATETIME2 (7) CONSTRAINT [DF_WebDeveloperNewsList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WebDeveloperNewsList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WebDeveloperNewsList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_WebDeveloperNewsList] UNIQUE NONCLUSTERED ([Title] ASC)
);


GO

