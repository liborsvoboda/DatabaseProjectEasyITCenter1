CREATE TABLE [dbo].[SystemCustomPageList] (
    [Id]                         INT            IDENTITY (1, 1) NOT NULL,
    [InheritedFormType]          VARCHAR (50)   CONSTRAINT [DF_SystemCustomPageList_InheritedFormType] DEFAULT ('') NOT NULL,
    [PageName]                   VARCHAR (250)  NOT NULL,
    [Description]                VARCHAR (MAX)  NULL,
    [IsInteractAgenda]           BIT            CONSTRAINT [DF_SystemCustomPageList_IsInteractAgenda] DEFAULT ((0)) NOT NULL,
    [IsSystemUrl]                BIT            CONSTRAINT [DF_SystemCustomPageList_IsSystemWebModule] DEFAULT ((0)) NOT NULL,
    [IsServerUrl]                BIT            NOT NULL,
    [IsOwnServerUrl]             BIT            NOT NULL,
    [DevModeEnabled]             BIT            CONSTRAINT [DF_SystemCustomPageList_DevModeEnabled] DEFAULT ((0)) NOT NULL,
    [ShowHelpTab]                BIT            CONSTRAINT [DF_SystemCustomPageList_ShowHelpTab] DEFAULT ((0)) NOT NULL,
    [HelpTabShowOnly]            BIT            CONSTRAINT [DF_SystemCustomPageList_HelpTabShowOnly] DEFAULT ((0)) NOT NULL,
    [InheritedHelpTabSourceType] VARCHAR (50)   NULL,
    [StartupUrl]                 VARCHAR (512)  CONSTRAINT [DF_SystemCustomPageList_StartupUrl] DEFAULT ('') NOT NULL,
    [HelpTabUrl]                 VARCHAR (512)  NULL,
    [DBTableName]                VARCHAR (255)  NULL,
    [ColumnName]                 VARCHAR (255)  NULL,
    [UseIOOverDom]               BIT            CONSTRAINT [DF_SystemCustomPageList_UseIOOverDom] DEFAULT ((0)) NOT NULL,
    [InheritedSetName]           VARCHAR (50)   NULL,
    [DOMHtmlElementName]         VARCHAR (255)  NULL,
    [SetWebDataJScriptCmd]       VARCHAR (1024) NULL,
    [GetWebDataJScriptCmd]       VARCHAR (1024) NULL,
    [StartupSubFolder]           VARCHAR (150)  NULL,
    [StartupCommand]             VARCHAR (500)  NULL,
    [Active]                     BIT            NOT NULL,
    [UserId]                     INT            NOT NULL,
    [TimeStamp]                  DATETIME2 (7)  CONSTRAINT [DF_SystemCustomPageList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SystemCustomPageList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SystemCustomPageList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_SystemCustomPageList] UNIQUE NONCLUSTERED ([PageName] ASC)
);


GO

