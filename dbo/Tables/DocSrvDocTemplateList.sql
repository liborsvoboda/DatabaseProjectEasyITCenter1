CREATE TABLE [dbo].[DocSrvDocTemplateList] (
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [InheritedCodeType] VARCHAR (50)  NOT NULL,
    [GroupId]           INT           NOT NULL,
    [Sequence]          INT           NOT NULL,
    [Name]              VARCHAR (50)  NOT NULL,
    [Description]       TEXT          NULL,
    [Template]          VARCHAR (MAX) NULL,
    [UserId]            INT           NOT NULL,
    [TimeStamp]         DATETIME2 (7) CONSTRAINT [DF_DocSrvDocTemplateList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DocSrvDocTemplateList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_DocSrvDocTemplateList_DocSrvDocumentationGroupList] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[DocSrvDocumentationGroupList] ([Id]),
    CONSTRAINT [FK_DocSrvDocTemplateList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_DocSrvDocTemplateList] UNIQUE NONCLUSTERED ([Name] ASC)
);


GO

