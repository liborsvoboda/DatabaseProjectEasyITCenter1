CREATE TABLE [dbo].[SystemIgnoredExceptionList] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [ErrorNumber] VARCHAR (50)  NOT NULL,
    [Description] TEXT          NULL,
    [Active]      BIT           CONSTRAINT [DF_IgnoredExceptionList_Active] DEFAULT ((1)) NOT NULL,
    [UserId]      INT           NOT NULL,
    [TimeStamp]   DATETIME2 (7) CONSTRAINT [DF_IgnoredExceptionList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_IgnoredExceptionList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_IgnoredExceptionList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_IgnoredExceptionList] UNIQUE NONCLUSTERED ([ErrorNumber] ASC)
);


GO

