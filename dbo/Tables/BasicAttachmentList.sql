CREATE TABLE [dbo].[BasicAttachmentList] (
    [Id]         INT             IDENTITY (1, 1) NOT NULL,
    [ParentId]   INT             NOT NULL,
    [ParentType] VARCHAR (20)    NOT NULL,
    [FileName]   VARCHAR (150)   NOT NULL,
    [Attachment] VARBINARY (MAX) NOT NULL,
    [UserId]     INT             NOT NULL,
    [TimeStamp]  DATETIME2 (7)   CONSTRAINT [DF_AttachmentList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_AttachmentList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_AttachmentList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [UX_AttachmentList] UNIQUE NONCLUSTERED ([ParentId] ASC, [FileName] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_AttachmentList]
    ON [dbo].[BasicAttachmentList]([ParentId] ASC, [ParentType] ASC);


GO

