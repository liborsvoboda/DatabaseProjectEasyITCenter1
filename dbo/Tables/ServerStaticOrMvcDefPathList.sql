CREATE TABLE [dbo].[ServerStaticOrMvcDefPathList] (
    [Id]                   INT            IDENTITY (1, 1) NOT NULL,
    [SystemName]           VARCHAR (50)   NOT NULL,
    [WebRootSubPath]       VARCHAR (2048) NOT NULL,
    [AliasPath]            VARCHAR (255)  NULL,
    [Description]          TEXT           NULL,
    [IsBrowsable]          BIT            CONSTRAINT [DF_ServerStaticOrMvcDefPathList_IsBowsable] DEFAULT ((0)) NOT NULL,
    [IsStaticOrMvcDefOnly] BIT            CONSTRAINT [DF_ServerStaticOrMvcDefPathList_IsStaticOrMvcDefOnly] DEFAULT ((0)) NOT NULL,
    [UserId]               INT            NOT NULL,
    [Active]               BIT            NOT NULL,
    [TimeStamp]            DATETIME2 (7)  CONSTRAINT [DF_ServerStaticOrMvcDefPathList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ServerStaticOrMvcDefPathList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ServerStaticOrMvcDefPathList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_ServerStaticOrMvcDefPathList] UNIQUE NONCLUSTERED ([SystemName] ASC)
);


GO

