CREATE TABLE [dbo].[ServerSettingList] (
    [Id]                 INT            IDENTITY (1, 1) NOT NULL,
    [InheritedGroupName] VARCHAR (50)   NOT NULL,
    [Type]               VARCHAR (50)   CONSTRAINT [DF_ServerSettingList_Type] DEFAULT ('bit') NOT NULL,
    [Key]                NVARCHAR (150) NOT NULL,
    [Value]              NVARCHAR (150) NOT NULL,
    [Description]        TEXT           NULL,
    [Link]               VARCHAR (1024) NULL,
    [UserId]             INT            NOT NULL,
    [Active]             BIT            CONSTRAINT [DF_AdminConfiguration_Active] DEFAULT ((1)) NOT NULL,
    [Timestamp]          DATETIME2 (7)  CONSTRAINT [DF_AdminConfiguration_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_AdminConfiguration] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ServerSettingList_SolutionUserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_ServerSettingList] UNIQUE NONCLUSTERED ([Key] ASC)
);


GO

