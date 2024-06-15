CREATE TABLE [dbo].[ServerCorsDefAllowedOriginList] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [AllowedDomain] VARCHAR (50)  NOT NULL,
    [Description]   TEXT          NULL,
    [UserId]        INT           NOT NULL,
    [Active]        BIT           CONSTRAINT [DF_ServerCorsDefAllowedOriginList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]     DATETIME2 (7) CONSTRAINT [DF_ServerCorsDefAllowedOriginList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ServerCorsDefAllowedOriginList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ServerCorsDefAllowedOriginList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_ServerCorsDefAllowedOriginList] UNIQUE NONCLUSTERED ([AllowedDomain] ASC)
);


GO

