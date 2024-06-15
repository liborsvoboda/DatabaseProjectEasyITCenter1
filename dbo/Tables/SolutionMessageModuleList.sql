CREATE TABLE [dbo].[SolutionMessageModuleList] (
    [Id]              INT           IDENTITY (1, 1) NOT NULL,
    [Level]           INT           CONSTRAINT [DF_SolutionMessageModuleList_Level] DEFAULT ((0)) NOT NULL,
    [MessageParentId] INT           NULL,
    [MessageTypeId]   INT           NOT NULL,
    [Subject]         VARCHAR (150) NOT NULL,
    [HtmlMessage]     TEXT          NOT NULL,
    [Shown]           BIT           NOT NULL,
    [Archived]        BIT           NOT NULL,
    [IsSystemMessage] BIT           NOT NULL,
    [Published]       BIT           CONSTRAINT [DF_SolutionMessageModuleList_Publish] DEFAULT ((0)) NOT NULL,
    [FromUserId]      INT           NULL,
    [ToUserId]        INT           NULL,
    [TimeStamp]       DATETIME2 (7) CONSTRAINT [DF_SolutionMessageModuleList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SolutionMessageModuleList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SolutionMessageModuleList_SolutionMessageModuleListParent] FOREIGN KEY ([MessageParentId]) REFERENCES [dbo].[SolutionMessageModuleList] ([Id]),
    CONSTRAINT [FK_SolutionMessageModuleList_SolutionMessageTypeList] FOREIGN KEY ([MessageTypeId]) REFERENCES [dbo].[SolutionMessageTypeList] ([Id]),
    CONSTRAINT [FK_SolutionMessageModuleList_SolutionUserListFrom] FOREIGN KEY ([FromUserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [FK_SolutionMessageModuleList_SolutionUserListTo] FOREIGN KEY ([ToUserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_SolutionMessageModuleList] UNIQUE NONCLUSTERED ([Subject] ASC)
);


GO

