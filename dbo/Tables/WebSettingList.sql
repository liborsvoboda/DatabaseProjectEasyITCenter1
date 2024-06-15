CREATE TABLE [dbo].[WebSettingList] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Key]         NVARCHAR (50) NOT NULL,
    [Value]       TEXT          NOT NULL,
    [Description] TEXT          NULL,
    [UserId]      INT           NOT NULL,
    [Timestamp]   DATETIME2 (7) CONSTRAINT [DF_WebSettingList_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WebSettingList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WebSettingList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [IX_WebSettingList] UNIQUE NONCLUSTERED ([Key] ASC)
);


GO

