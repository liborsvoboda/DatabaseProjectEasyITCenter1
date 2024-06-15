CREATE TABLE [dbo].[ServerLiveDataMonitorList] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [RootPath]       VARCHAR (1024) NOT NULL,
    [FileExtensions] VARCHAR (1024) NOT NULL,
    [Description]    TEXT           NULL,
    [UserId]         INT            NOT NULL,
    [Active]         BIT            CONSTRAINT [DF_ServerLiveDataMonitorList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]      DATETIME2 (7)  CONSTRAINT [DF_ServerLiveDataMonitorList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ServerLiveDataMonitorList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ServerLiveDataMonitorList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_ServerLiveDataMonitorList] UNIQUE NONCLUSTERED ([RootPath] ASC)
);


GO

