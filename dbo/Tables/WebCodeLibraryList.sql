CREATE TABLE [dbo].[WebCodeLibraryList] (
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [InheritedCodeType] VARCHAR (50)   NULL,
    [Name]              VARCHAR (50)   NOT NULL,
    [Description]       VARCHAR (2096) NULL,
    [Content]           VARCHAR (MAX)  NOT NULL,
    [IsCompletion]      BIT            CONSTRAINT [DF_WebCodeLibraryList_IsCompletion] DEFAULT ((0)) NOT NULL,
    [UserId]            INT            NOT NULL,
    [TimeStamp]         DATETIME2 (7)  CONSTRAINT [DF_WebCodeLibraryList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WebCodeLibraryList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WebCodeLibraryList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_WebCodeLibraryList] UNIQUE NONCLUSTERED ([Name] ASC)
);


GO

