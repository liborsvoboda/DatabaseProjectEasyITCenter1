CREATE TABLE [dbo].[SystemLoginHistoryList] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [IpAddress] VARCHAR (50)  NOT NULL,
    [UserId]    INT           CONSTRAINT [DF_LoginHistoryList_UserId] DEFAULT ((0)) NOT NULL,
    [UserName]  VARCHAR (150) NOT NULL,
    [Timestamp] DATETIME2 (7) CONSTRAINT [DF_LoginHistory_timestamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LoginHistory] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_LoginHistoryList]
    ON [dbo].[SystemLoginHistoryList]([IpAddress] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_LoginHistoryList_1]
    ON [dbo].[SystemLoginHistoryList]([UserId] ASC);


GO

