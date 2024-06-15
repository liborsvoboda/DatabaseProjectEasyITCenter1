CREATE TABLE [dbo].[WebGlobalPageBlockList] (
    [Id]                  INT           IDENTITY (1, 1) NOT NULL,
    [PagePartType]        VARCHAR (50)  NOT NULL,
    [Sequence]            INT           NOT NULL,
    [Name]                VARCHAR (50)  NOT NULL,
    [Description]         TEXT          NULL,
    [RewriteLowerLevel]   BIT           NOT NULL,
    [GuestHtmlContent]    TEXT          NULL,
    [UserHtmlContent]     TEXT          NULL,
    [AdminHtmlContent]    TEXT          NULL,
    [ProviderHtmlContent] TEXT          NULL,
    [Active]              BIT           NOT NULL,
    [UserId]              INT           NOT NULL,
    [TimeStamp]           DATETIME2 (7) CONSTRAINT [DF_WebGlobalBodyBlockList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WebGlobalBodyBlockList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WebGlobalBodyBlockList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_WebGlobalBodyBlockList] UNIQUE NONCLUSTERED ([Name] ASC, [PagePartType] ASC)
);


GO

