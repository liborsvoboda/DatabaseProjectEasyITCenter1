CREATE TABLE [dbo].[SolutionMottoList] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [SystemName] VARCHAR (50)  NOT NULL,
    [UserId]     INT           CONSTRAINT [DF_MottoList_UserId] DEFAULT ((1)) NOT NULL,
    [Timestamp]  DATETIME2 (7) CONSTRAINT [DF_MottoList_Timestamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_MottoList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_MottoList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_MottoList] UNIQUE NONCLUSTERED ([SystemName] ASC)
);


GO

