CREATE TABLE [dbo].[WebVisitIpList] (
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [WebHostIp]         VARCHAR (50)  NOT NULL,
    [Description]       TEXT          NULL,
    [WhoIsInformations] TEXT          NULL,
    [TimeStamp]         DATETIME2 (7) CONSTRAINT [DF_WebVisitIpList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WebVisitIpList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [IX_WebVisitIpList] UNIQUE NONCLUSTERED ([WebHostIp] ASC, [TimeStamp] ASC)
);


GO

