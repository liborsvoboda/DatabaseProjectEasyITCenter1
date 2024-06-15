CREATE TABLE [dbo].[WebConfiguratorList] (
    [Id]              INT           IDENTITY (1, 1) NOT NULL,
    [Name]            VARCHAR (50)  NOT NULL,
    [IsStartupPage]   BIT           NOT NULL,
    [Description]     VARCHAR (MAX) NULL,
    [HtmlContent]     VARCHAR (MAX) NULL,
    [ServerUrl]       VARCHAR (500) NULL,
    [AuthRole]        VARCHAR (200) NULL,
    [AuthIgnore]      BIT           NOT NULL,
    [AuthRedirect]    BIT           NOT NULL,
    [AuthRedirectUrl] VARCHAR (500) NULL,
    [IncludedIdList]  VARCHAR (500) NULL,
    [Active]          BIT           CONSTRAINT [DF_WebConfiguratorList_Active] DEFAULT ((1)) NOT NULL,
    [UserId]          INT           NOT NULL,
    [TimeStamp]       DATETIME2 (7) CONSTRAINT [DF_WebConfiguratorList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WebConfiguratorList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WebConfiguratorList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_WebConfiguratorList] UNIQUE NONCLUSTERED ([Name] ASC),
    CONSTRAINT [IX_WebConfiguratorList_1] UNIQUE NONCLUSTERED ([ServerUrl] ASC)
);


GO

