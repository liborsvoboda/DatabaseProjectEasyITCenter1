CREATE TABLE [dbo].[WebUserSettingList] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [Key]       NVARCHAR (50)  NOT NULL,
    [Value]     NVARCHAR (250) NOT NULL,
    [UserId]    INT            NOT NULL,
    [Timestamp] DATETIME2 (7)  CONSTRAINT [DF_WebUserSettingList_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WebUserSettingList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WebUserSettingList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [IX_WebUserSettingList] UNIQUE NONCLUSTERED ([UserId] ASC, [Key] ASC)
);


GO

