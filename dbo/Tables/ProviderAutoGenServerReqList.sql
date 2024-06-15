CREATE TABLE [dbo].[ProviderAutoGenServerReqList] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [IpAddress]   VARCHAR (20)  NOT NULL,
    [Name]        VARCHAR (100) NOT NULL,
    [Description] TEXT          NULL,
    [UserId]      INT           NULL,
    [TimeStamp]   DATETIME2 (7) CONSTRAINT [DF_ProviderAutoGenServerCreateRequest_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ProviderAutoGenServerCreateRequest] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ProviderAutoGenServerCreateRequest_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_ProviderAutoGenServerCreateRequest] UNIQUE NONCLUSTERED ([Name] ASC)
);


GO

