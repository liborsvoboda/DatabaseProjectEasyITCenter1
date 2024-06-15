CREATE TABLE [dbo].[SolutionFailList] (
    [Id]             INT             IDENTITY (1, 1) NOT NULL,
    [Source]         VARCHAR (50)    NOT NULL,
    [UserName]       VARCHAR (50)    NULL,
    [LogLevel]       VARCHAR (20)    NULL,
    [Message]        TEXT            NOT NULL,
    [ImageName]      VARCHAR (150)   NULL,
    [Image]          VARBINARY (MAX) NULL,
    [AttachmentName] VARCHAR (150)   NULL,
    [Attachment]     VARBINARY (MAX) NULL,
    [UserId]         INT             NULL,
    [TimeStamp]      DATETIME2 (7)   CONSTRAINT [DF_SolutionFailList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SolutionFailList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SolutionFailList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id])
);


GO

