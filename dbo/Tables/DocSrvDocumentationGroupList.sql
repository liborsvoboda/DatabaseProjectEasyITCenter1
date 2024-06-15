CREATE TABLE [dbo].[DocSrvDocumentationGroupList] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (50)  NOT NULL,
    [Sequence]    INT           NOT NULL,
    [Description] TEXT          NULL,
    [UserId]      INT           NOT NULL,
    [Active]      BIT           CONSTRAINT [DF_DocumentationGroupList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]   DATETIME2 (7) CONSTRAINT [DF_DocumentationGroupList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DocumentationGroupList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_DocumentationGroupList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_DocumentationGroupList] UNIQUE NONCLUSTERED ([Name] ASC)
);


GO

