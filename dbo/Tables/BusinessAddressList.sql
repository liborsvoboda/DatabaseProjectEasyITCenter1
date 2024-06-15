CREATE TABLE [dbo].[BusinessAddressList] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [AddressType] VARCHAR (20)  NOT NULL,
    [CompanyName] VARCHAR (150) NOT NULL,
    [ContactName] VARCHAR (150) NULL,
    [Street]      VARCHAR (150) NOT NULL,
    [City]        VARCHAR (150) NOT NULL,
    [PostCode]    VARCHAR (20)  NOT NULL,
    [Phone]       VARCHAR (20)  NOT NULL,
    [Email]       VARCHAR (150) NULL,
    [BankAccount] VARCHAR (150) NULL,
    [Ico]         VARCHAR (20)  NULL,
    [Dic]         VARCHAR (20)  NULL,
    [UserId]      INT           NOT NULL,
    [Active]      BIT           CONSTRAINT [DF_AddressList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]   DATETIME2 (7) CONSTRAINT [DF_AddressList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_AddressList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_AddressList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id])
);


GO

CREATE NONCLUSTERED INDEX [IX_AddressList]
    ON [dbo].[BusinessAddressList]([AddressType] ASC);


GO

