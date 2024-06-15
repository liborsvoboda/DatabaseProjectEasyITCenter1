CREATE TABLE [dbo].[BusinessIncomingInvoiceList] (
    [Id]                INT             IDENTITY (1, 1) NOT NULL,
    [DocumentNumber]    VARCHAR (20)    NOT NULL,
    [Supplier]          VARCHAR (512)   NOT NULL,
    [Customer]          VARCHAR (512)   NOT NULL,
    [IssueDate]         DATETIME2 (7)   NOT NULL,
    [TaxDate]           DATETIME2 (7)   NOT NULL,
    [MaturityDate]      DATETIME2 (7)   NOT NULL,
    [PaymentMethodId]   INT             NOT NULL,
    [MaturityId]        INT             NOT NULL,
    [OrderNumber]       VARCHAR (50)    NULL,
    [Storned]           BIT             NOT NULL,
    [PaymentStatusId]   INT             NOT NULL,
    [TotalCurrencyId]   INT             NOT NULL,
    [Description]       TEXT            NULL,
    [TotalPriceWithVat] NUMERIC (10, 2) NOT NULL,
    [UserId]            INT             NOT NULL,
    [TimeStamp]         DATETIME2 (7)   CONSTRAINT [DF_IncomingInvoiceList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_IncomingInvoiceList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_IncomingInvoiceList_CurrencyList] FOREIGN KEY ([TotalCurrencyId]) REFERENCES [dbo].[BasicCurrencyList] ([Id]),
    CONSTRAINT [FK_IncomingInvoiceList_MaturityList] FOREIGN KEY ([MaturityId]) REFERENCES [dbo].[BusinessMaturityList] ([Id]),
    CONSTRAINT [FK_IncomingInvoiceList_PaymentMethodList] FOREIGN KEY ([PaymentMethodId]) REFERENCES [dbo].[BusinessPaymentMethodList] ([Id]),
    CONSTRAINT [FK_IncomingInvoiceList_PaymentStatusList] FOREIGN KEY ([PaymentStatusId]) REFERENCES [dbo].[BusinessPaymentStatusList] ([Id]),
    CONSTRAINT [FK_IncomingInvoiceList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_IncomingInvoiceList] UNIQUE NONCLUSTERED ([DocumentNumber] ASC)
);


GO

