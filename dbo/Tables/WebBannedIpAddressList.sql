CREATE TABLE [dbo].[WebBannedIpAddressList] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [IpAddress]   VARCHAR (50)  NOT NULL,
    [Description] TEXT          NULL,
    [UserId]      INT           NOT NULL,
    [Active]      BIT           CONSTRAINT [DF_WebBannedUserList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]   DATETIME2 (7) CONSTRAINT [DF_WebBannedUserList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WebBannedUserList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WebBannedUserList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_WebBannedUserList] UNIQUE NONCLUSTERED ([IpAddress] ASC)
);


GO

