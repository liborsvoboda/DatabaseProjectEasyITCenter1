CREATE TABLE [dbo].[BusinessOutgoingOrderList] (
    [Id]                INT             IDENTITY (1, 1) NOT NULL,
    [DocumentNumber]    VARCHAR (20)    NOT NULL,
    [Customer]          VARCHAR (512)   NOT NULL,
    [Supplier]          VARCHAR (512)   NOT NULL,
    [Storned]           BIT             NOT NULL,
    [TotalCurrencyId]   INT             NOT NULL,
    [Description]       TEXT            NULL,
    [TotalPriceWithVat] NUMERIC (10, 2) NOT NULL,
    [UserId]            INT             NOT NULL,
    [TimeStamp]         DATETIME2 (7)   CONSTRAINT [DF_OutgoingOrderList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_OutgoingOrderList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_OutgoingOrderList_CurrencyList] FOREIGN KEY ([TotalCurrencyId]) REFERENCES [dbo].[BasicCurrencyList] ([Id]),
    CONSTRAINT [FK_OutgoingOrderList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_OutgoingOrderList] UNIQUE NONCLUSTERED ([DocumentNumber] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_OutgoingOrderList_Supplier]
    ON [dbo].[BusinessOutgoingOrderList]([Supplier] ASC);


GO

