CREATE TABLE [dbo].[WebGroupMenuList] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [Sequence]  INT           NOT NULL,
    [Onclick]   VARCHAR (255) NULL,
    [Name]      VARCHAR (50)  NOT NULL,
    [UserId]    INT           NOT NULL,
    [Active]    BIT           NOT NULL,
    [TimeStamp] DATETIME2 (7) CONSTRAINT [DF_WebGroupMenuList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WebGroupMenuList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WebGroupMenuList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_WebGroupMenuList] UNIQUE NONCLUSTERED ([Name] ASC)
);


GO

