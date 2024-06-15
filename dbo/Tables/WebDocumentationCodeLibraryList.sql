CREATE TABLE [dbo].[WebDocumentationCodeLibraryList] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (50)   NOT NULL,
    [Description] VARCHAR (2096) NULL,
    [MdContent]   TEXT           NOT NULL,
    [HtmlContent] TEXT           NOT NULL,
    [UserId]      INT            NOT NULL,
    [TimeStamp]   DATETIME2 (7)  CONSTRAINT [DF_WebDocumentationCodeLibraryList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WebDocumentationCodeLibraryList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WebDocumentationCodeLibraryList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_WebDocumentationCodeLibraryList] UNIQUE NONCLUSTERED ([Name] ASC)
);


GO

