CREATE TABLE [dbo].[SolutionSchedulerList] (
    [Id]                    INT           IDENTITY (1, 1) NOT NULL,
    [InheritedGroupName]    VARCHAR (50)  NOT NULL,
    [Name]                  VARCHAR (255) NOT NULL,
    [Sequence]              INT           NOT NULL,
    [Email]                 VARCHAR (255) NULL,
    [Data]                  TEXT          NOT NULL,
    [Description]           TEXT          NULL,
    [StartNowOnly]          BIT           NOT NULL,
    [StartAt]               DATETIME2 (7) NULL,
    [FinishAt]              DATETIME2 (7) NULL,
    [Interval]              INT           NOT NULL,
    [InheritedIntervalType] VARCHAR (50)  NOT NULL,
    [UserId]                INT           NOT NULL,
    [Active]                BIT           CONSTRAINT [DF_GlobalAutoSchedulerList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]             DATETIME2 (7) CONSTRAINT [DF_GlobalAutoSchedulerList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SolutionSchedulerList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GlobalAutoSchedulerList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id])
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_SolutionSchedulerList]
    ON [dbo].[SolutionSchedulerList]([Name] ASC);


GO

