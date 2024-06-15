CREATE TABLE [dbo].[ProviderGeneratedLicenseList] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [PartNumber]  VARCHAR (50)  NOT NULL,
    [Type]        VARCHAR (50)  NOT NULL,
    [Expiration]  DATETIME2 (7) NOT NULL,
    [Description] TEXT          NULL,
    [UserId]      INT           NOT NULL,
    [TimeStamp]   DATETIME2 (7) CONSTRAINT [DF_ProviderGeneratedLicenseList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ProviderGeneratedLicenseList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ProviderGeneratedLicenseList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_ProviderGeneratedLicenseList] UNIQUE NONCLUSTERED ([PartNumber] ASC)
);


GO

