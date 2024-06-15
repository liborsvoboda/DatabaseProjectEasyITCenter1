CREATE TABLE [dbo].[SolutionSchedulerProcessList] (
    [Id]               INT           IDENTITY (1, 1) NOT NULL,
    [ScheduledTaskId]  INT           NOT NULL,
    [ProcessData]      TEXT          NULL,
    [ProcessLog]       TEXT          NULL,
    [ProcessCrashed]   BIT           NOT NULL,
    [ProcessCompleted] BIT           NOT NULL,
    [TimeStamp]        DATETIME2 (7) CONSTRAINT [DF_SolutionSchedulerProcessList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SolutionSchedulerProcessList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SolutionSchedulerProcessList_SolutionSchedulerList] FOREIGN KEY ([ScheduledTaskId]) REFERENCES [dbo].[SolutionSchedulerList] ([Id]) ON DELETE CASCADE
);


GO

