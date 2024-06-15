CREATE TABLE [dbo].[BusinessExchangeRateList] (
    [Id]          INT             IDENTITY (1, 1) NOT NULL,
    [CurrencyId]  INT             NOT NULL,
    [Value]       DECIMAL (10, 2) NOT NULL,
    [ValidFrom]   DATE            NULL,
    [ValidTo]     DATE            NULL,
    [Description] TEXT            NULL,
    [UserId]      INT             NOT NULL,
    [Active]      BIT             CONSTRAINT [DF_CourseList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]   DATETIME2 (7)   CONSTRAINT [DF_CourseList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_CourseList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CourseList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [FK_ExchangeRateList_CurrencyList] FOREIGN KEY ([CurrencyId]) REFERENCES [dbo].[BasicCurrencyList] ([Id])
);


GO

