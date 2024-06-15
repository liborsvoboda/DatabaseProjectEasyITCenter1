CREATE TABLE [dbo].[SystemMenuList] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [MenuType]      VARCHAR (50)   NOT NULL,
    [GroupId]       INT            NOT NULL,
    [FormPageName]  VARCHAR (250)  NOT NULL,
    [AccessRole]    VARCHAR (1024) NOT NULL,
    [Description]   TEXT           NULL,
    [UserId]        INT            NOT NULL,
    [NotShowInMenu] BIT            CONSTRAINT [DF_SystemMenuList_NotShowInMenu] DEFAULT ((0)) NOT NULL,
    [Active]        BIT            CONSTRAINT [DF_SystemMenuList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]     DATETIME2 (7)  CONSTRAINT [DF_SystemMenuList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SystemMenuList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SystemMenuList_SystemGroupMenuList] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[SystemGroupMenuList] ([Id]),
    CONSTRAINT [FK_SystemMenuList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_GlobalMenuList] UNIQUE NONCLUSTERED ([FormPageName] ASC)
);


GO

