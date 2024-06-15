CREATE TABLE [dbo].[ProdGuidWorkList] (
    [Id]              INT             IDENTITY (1, 1) NOT NULL,
    [Date]            DATETIME2 (7)   NOT NULL,
    [PersonalNumber]  INT             NOT NULL,
    [WorkPlace]       INT             NOT NULL,
    [OperationNumber] INT             NOT NULL,
    [WorkTime]        TIME (7)        NOT NULL,
    [Pcs]             INT             NOT NULL,
    [Amount]          NUMERIC (10, 2) NOT NULL,
    [WorkPower]       NUMERIC (10, 2) NOT NULL,
    [UserId]          INT             NOT NULL,
    [Timestamp]       DATETIME2 (7)   NOT NULL,
    CONSTRAINT [PK_ProdGuidWorkList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ProdGuidWorkList_ProdGuidPersonList] FOREIGN KEY ([PersonalNumber]) REFERENCES [dbo].[ProdGuidPersonList] ([PersonalNumber]),
    CONSTRAINT [FK_ProdGuidWorkList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id])
);


GO

