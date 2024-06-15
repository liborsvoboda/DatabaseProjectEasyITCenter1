CREATE TABLE [dbo].[SolutionTaskList] (
    [Id]                  INT             IDENTITY (1, 1) NOT NULL,
    [InheritedTargetType] VARCHAR (50)    NOT NULL,
    [InheritedStatusType] VARCHAR (50)    NOT NULL,
    [Message]             TEXT            NOT NULL,
    [Documentation]       TEXT            NOT NULL,
    [ImageName]           VARCHAR (150)   NULL,
    [Image]               VARBINARY (MAX) NULL,
    [AttachmentName]      VARCHAR (150)   NULL,
    [Attachment]          VARBINARY (MAX) NULL,
    [UserId]              INT             NOT NULL,
    [TimeStamp]           DATETIME2 (7)   CONSTRAINT [DF_SolutionTaskList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SolutionTaskList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SolutionTaskList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id])
);


GO

CREATE NONCLUSTERED INDEX [IX_SolutionTaskList]
    ON [dbo].[SolutionTaskList]([InheritedTargetType] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_SolutionTaskList_2]
    ON [dbo].[SolutionTaskList]([InheritedStatusType] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_SolutionTaskList_1]
    ON [dbo].[SolutionTaskList]([InheritedTargetType] ASC, [InheritedStatusType] ASC);


GO

