CREATE TABLE [dbo].[BusinessOfferList] (
    [Id]                INT             IDENTITY (1, 1) NOT NULL,
    [DocumentNumber]    VARCHAR (20)    NOT NULL,
    [Supplier]          VARCHAR (512)   NOT NULL,
    [Customer]          VARCHAR (512)   NOT NULL,
    [OfferValidity]     INT             NOT NULL,
    [Storned]           BIT             NOT NULL,
    [TotalCurrencyId]   INT             NOT NULL,
    [Description]       TEXT            NULL,
    [TotalPriceWithVat] NUMERIC (10, 2) NOT NULL,
    [UserId]            INT             NOT NULL,
    [TimeStamp]         DATETIME2 (7)   CONSTRAINT [DF_OfferList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_OfferList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_OfferList_CurrencyList1] FOREIGN KEY ([TotalCurrencyId]) REFERENCES [dbo].[BasicCurrencyList] ([Id]),
    CONSTRAINT [FK_OfferList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_OfferList] UNIQUE NONCLUSTERED ([DocumentNumber] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_OfferList_Customer]
    ON [dbo].[BusinessOfferList]([Customer] ASC);


GO

