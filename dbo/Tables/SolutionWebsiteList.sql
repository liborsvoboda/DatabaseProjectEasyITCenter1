CREATE TABLE [dbo].[SolutionWebsiteList] (
    [Id]                      INT           IDENTITY (1, 1) NOT NULL,
    [WebsiteName]             VARCHAR (50)  NOT NULL,
    [Description]             TEXT          NULL,
    [MinimalReadAccessValue]  INT           CONSTRAINT [DF_SolutionWebsiteList_MinimalReadAccessValue] DEFAULT ((0)) NOT NULL,
    [MinimalWriteAccessValue] INT           CONSTRAINT [DF_SolutionWebsiteList_MinimalWriteAccessValue] DEFAULT ((0)) NOT NULL,
    [UserId]                  INT           NOT NULL,
    [Active]                  BIT           CONSTRAINT [DF_SolutionWebsiteList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]               DATETIME2 (7) CONSTRAINT [DF_SolutionWebsiteList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SolutionWebsiteList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SolutionWebsiteList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_SolutionWebsiteList] UNIQUE NONCLUSTERED ([WebsiteName] ASC)
);


GO

