CREATE TABLE [dbo].[ServerApiSecurityList] (
    [Id]                    INT           IDENTITY (1, 1) NOT NULL,
    [InheritedApiType]      VARCHAR (50)  NOT NULL,
    [Name]                  VARCHAR (50)  NOT NULL,
    [Description]           TEXT          NULL,
    [UrlSubPath]            VARCHAR (100) NULL,
    [WriteAllowedRoles]     VARCHAR (500) NULL,
    [ReadAllowedRoles]      VARCHAR (500) NULL,
    [WriteRestrictedAccess] BIT           NOT NULL,
    [ReadRestrictedAccess]  BIT           CONSTRAINT [DF_ServerApiSecurityList_ReadRestrictedAccess] DEFAULT ((0)) NOT NULL,
    [RedirectPathOnError]   VARCHAR (100) NULL,
    [Active]                BIT           CONSTRAINT [DF_ServerApiSecurityList_Active] DEFAULT ((1)) NOT NULL,
    [UserId]                INT           NOT NULL,
    [TimeStamp]             DATETIME2 (7) CONSTRAINT [DF_ServerApiSecurityList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ServerApiSecurityList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ServerApiSecurityList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_ServerApiSecurityList] UNIQUE NONCLUSTERED ([Name] ASC),
    CONSTRAINT [IX_ServerApiSecurityList_2] UNIQUE NONCLUSTERED ([UrlSubPath] ASC)
);


GO

