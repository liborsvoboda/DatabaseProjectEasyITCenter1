CREATE TABLE [dbo].[SystemDocumentTypeList] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [SystemName]  VARCHAR (50)  CONSTRAINT [DF_DocumentTypeList_SystemName] DEFAULT ('MustProgramming') NOT NULL,
    [Description] TEXT          NULL,
    [UserId]      INT           NOT NULL,
    [Timestamp]   DATETIME2 (7) CONSTRAINT [DF_DocumentTypeList_Timestamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DocumentTypeList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_DocumentTypeList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_DocumentTypeList] UNIQUE NONCLUSTERED ([SystemName] ASC)
);


GO

