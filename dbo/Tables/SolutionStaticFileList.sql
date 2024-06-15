CREATE TABLE [dbo].[SolutionStaticFileList] (
    [Id]           INT             IDENTITY (1, 1) NOT NULL,
    [WebsiteId]    INT             NOT NULL,
    [StaticPathId] INT             NOT NULL,
    [FileNamePath] VARCHAR (512)   NOT NULL,
    [MimeType]     VARCHAR (150)   NOT NULL,
    [Content]      VARBINARY (MAX) NULL,
    [Active]       BIT             CONSTRAINT [DF_SolutionStaticFileList_Active] DEFAULT ((1)) NOT NULL,
    [UserId]       INT             NULL,
    [TimeStamp]    DATETIME2 (7)   CONSTRAINT [DF_SolutionStaticFileList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SolutionStaticFileList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SolutionStaticFileList_SolutionStaticFilePathList] FOREIGN KEY ([StaticPathId]) REFERENCES [dbo].[SolutionStaticFilePathList] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_SolutionStaticFileList_SolutionWebsiteList] FOREIGN KEY ([WebsiteId]) REFERENCES [dbo].[SolutionWebsiteList] ([Id]),
    CONSTRAINT [FK_SolutionStaticFileList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_SolutionStaticFileList] UNIQUE NONCLUSTERED ([FileNamePath] ASC, [UserId] ASC)
);


GO

