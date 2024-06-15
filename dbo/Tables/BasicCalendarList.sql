CREATE TABLE [dbo].[BasicCalendarList] (
    [UserId]    INT            NOT NULL,
    [Date]      DATE           NOT NULL,
    [Notes]     VARCHAR (1024) NULL,
    [TimeStamp] DATETIME2 (7)  CONSTRAINT [DF_Calendar_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Calendar] PRIMARY KEY CLUSTERED ([UserId] ASC, [Date] ASC),
    CONSTRAINT [FK_Calendar_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO

