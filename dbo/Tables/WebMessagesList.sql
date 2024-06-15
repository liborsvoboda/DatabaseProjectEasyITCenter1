CREATE TABLE [dbo].[WebMessagesList] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (50)  NOT NULL,
    [Description] TEXT          NULL,
    [UserId]      INT           NOT NULL,
    [Active]      BIT           CONSTRAINT [DF_WebMessagesList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]   DATETIME2 (7) CONSTRAINT [DF_WebMessagesList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WebMessagesList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WebMessagesList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_WebMessagesList] UNIQUE NONCLUSTERED ([Name] ASC)
);


GO

