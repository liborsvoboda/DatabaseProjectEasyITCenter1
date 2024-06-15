CREATE TABLE [dbo].[ServerToolPanelDefinitionList] (
    [Id]              INT           IDENTITY (1, 1) NOT NULL,
    [ToolTypeId]      INT           NOT NULL,
    [SystemName]      VARCHAR (50)  NOT NULL,
    [Type]            VARCHAR (50)  NOT NULL,
    [Command]         VARCHAR (500) NOT NULL,
    [IconName]        VARCHAR (50)  NOT NULL,
    [IconColor]       VARCHAR (50)  NOT NULL,
    [BackgroundColor] VARCHAR (50)  NOT NULL,
    [Description]     TEXT          NULL,
    [UserId]          INT           NOT NULL,
    [Timestamp]       DATETIME2 (7) CONSTRAINT [DF_ServerToolPanelDefinitionList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ServerToolPanelDefinitionList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ServerToolPanelDefinitionList_ToolTypeList] FOREIGN KEY ([ToolTypeId]) REFERENCES [dbo].[ServerToolTypeList] ([Id]),
    CONSTRAINT [FK_ServerToolPanelDefinitionList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_ServerToolPanelDefinitionList] UNIQUE NONCLUSTERED ([SystemName] ASC)
);


GO

