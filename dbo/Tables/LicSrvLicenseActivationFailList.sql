CREATE TABLE [dbo].[LicSrvLicenseActivationFailList] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [IpAddress]  VARCHAR (50)  NOT NULL,
    [UnlockCode] VARCHAR (50)  NULL,
    [PartNumber] VARCHAR (50)  NULL,
    [TimeStamp]  DATETIME2 (7) CONSTRAINT [DF_LicenceActivationFailList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LicenseActivationFailList] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_LicenseActivationFailList_PartNumber]
    ON [dbo].[LicSrvLicenseActivationFailList]([PartNumber] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_LicenseActivationFailList_IpAddress]
    ON [dbo].[LicSrvLicenseActivationFailList]([IpAddress] ASC);


GO

