CREATE TABLE [dbo].[SolutionStaticFilePathList] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [WebsiteId] INT           NOT NULL,
    [Path]      VARCHAR (512) NOT NULL,
    [Size]      INT           NOT NULL,
    [Active]    BIT           CONSTRAINT [DF_SolutionStaticFilePathList_Active] DEFAULT ((1)) NOT NULL,
    [UserId]    INT           NULL,
    [TimeStamp] DATETIME2 (7) CONSTRAINT [DF_SolutionStaticFilePathList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SolutionStaticFilePathList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SolutionStaticFilePathList_SolutionWebsiteList] FOREIGN KEY ([WebsiteId]) REFERENCES [dbo].[SolutionWebsiteList] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_SolutionStaticFilePathList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_SolutionStaticFilePathList] UNIQUE NONCLUSTERED ([Path] ASC, [UserId] ASC)
);


GO

