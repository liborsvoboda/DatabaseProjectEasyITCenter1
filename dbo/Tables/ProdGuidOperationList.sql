CREATE TABLE [dbo].[ProdGuidOperationList] (
    [Id]              INT             IDENTITY (1, 1) NOT NULL,
    [WorkPlace]       INT             NOT NULL,
    [PartNumber]      VARCHAR (50)    NOT NULL,
    [OperationNumber] INT             NOT NULL,
    [Note]            VARCHAR (100)   NOT NULL,
    [PcsPerHour]      INT             NOT NULL,
    [KcPerKs]         NUMERIC (10, 4) NOT NULL,
    [UserId]          INT             NOT NULL,
    [Timestamp]       DATETIME2 (7)   NOT NULL,
    CONSTRAINT [PK_ProdGuidOperationList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ProdGuidOperationList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_ProdGuidOperationList] UNIQUE NONCLUSTERED ([WorkPlace] ASC, [OperationNumber] ASC)
);


GO

