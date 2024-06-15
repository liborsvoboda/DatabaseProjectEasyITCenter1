CREATE TABLE [dbo].[SystemSvgIconList] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (50)   NOT NULL,
    [SvgIconPath] VARCHAR (4096) NOT NULL,
    [UserId]      INT            NOT NULL,
    [TimeStamp]   DATETIME2 (7)  CONSTRAINT [DF_SvgIconList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SvgIconList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SvgIconList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_SvgIconList] UNIQUE NONCLUSTERED ([Name] ASC)
);


GO

