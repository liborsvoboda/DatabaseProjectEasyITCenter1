CREATE TABLE [dbo].[SystemDocumentAdviceList] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [BranchId]     INT           NOT NULL,
    [DocumentType] VARCHAR (50)  NOT NULL,
    [Prefix]       VARCHAR (10)  NOT NULL,
    [Number]       VARCHAR (10)  NOT NULL,
    [StartDate]    DATE          NOT NULL,
    [EndDate]      DATE          NOT NULL,
    [UserId]       INT           NOT NULL,
    [Active]       BIT           CONSTRAINT [DF_DocumentAdvice_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]    DATETIME2 (7) CONSTRAINT [DF_DocumentAdvice_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DocumentAdvice] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_DocumentAdvice_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [FK_DocumentAdviceList_BranchList] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[BusinessBranchList] ([Id]),
    CONSTRAINT [FK_DocumentAdviceList_DocumentTypeList] FOREIGN KEY ([DocumentType]) REFERENCES [dbo].[SystemDocumentTypeList] ([SystemName])
);


GO

CREATE NONCLUSTERED INDEX [IX_DocumentAdviceList]
    ON [dbo].[SystemDocumentAdviceList]([BranchId] ASC, [DocumentType] ASC);


GO

