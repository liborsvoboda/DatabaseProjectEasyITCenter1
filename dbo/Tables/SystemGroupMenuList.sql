CREATE TABLE [dbo].[SystemGroupMenuList] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [SystemName]  VARCHAR (50)  NOT NULL,
    [Description] TEXT          NULL,
    [UserId]      INT           NOT NULL,
    [Active]      BIT           CONSTRAINT [DF_SystemGroupMenuList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]   DATETIME2 (7) CONSTRAINT [DF_SystemGroupMenuList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SystemGroupMenuList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SystemGroupMenuList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_SystemGroupMenuList] UNIQUE NONCLUSTERED ([SystemName] ASC)
);


GO

