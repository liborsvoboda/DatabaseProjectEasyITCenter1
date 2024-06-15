CREATE TABLE [dbo].[BusinessIncomingOrderSupportList] (
    [Id]                INT             IDENTITY (1, 1) NOT NULL,
    [DocumentNumber]    VARCHAR (20)    NOT NULL,
    [PartNumber]        VARCHAR (50)    NULL,
    [Name]              VARCHAR (150)   NOT NULL,
    [Unit]              VARCHAR (10)    NOT NULL,
    [PcsPrice]          NUMERIC (10, 2) NOT NULL,
    [Count]             NUMERIC (10, 2) NOT NULL,
    [TotalPrice]        NUMERIC (10, 2) NOT NULL,
    [Vat]               NUMERIC (10, 2) NOT NULL,
    [TotalPriceWithVat] NUMERIC (10, 2) NOT NULL,
    [UserId]            INT             NOT NULL,
    [TimeStamp]         DATETIME2 (7)   CONSTRAINT [DF_IncomingOrderItemList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_IncomingOrderItemList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_IncomingOrderItemList_IncomingOrderList] FOREIGN KEY ([DocumentNumber]) REFERENCES [dbo].[BusinessIncomingOrderList] ([DocumentNumber]) ON DELETE CASCADE,
    CONSTRAINT [FK_IncomingOrderItemList_UnitList] FOREIGN KEY ([Unit]) REFERENCES [dbo].[BasicUnitList] ([Name]),
    CONSTRAINT [FK_IncomingOrderItemList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id])
);


GO

CREATE NONCLUSTERED INDEX [IX_IncomingOrderItemList]
    ON [dbo].[BusinessIncomingOrderSupportList]([DocumentNumber] ASC);


GO

