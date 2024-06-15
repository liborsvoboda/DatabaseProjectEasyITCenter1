CREATE TABLE [dbo].[WebCoreFileList] (
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [SpecificationType] VARCHAR (50)  NOT NULL,
    [Sequence]          INT           NOT NULL,
    [MetroPath]         VARCHAR (100) CONSTRAINT [DF_WebCoreFileList_MetroPath] DEFAULT ('') NOT NULL,
    [FileName]          VARCHAR (50)  NOT NULL,
    [Description]       TEXT          NULL,
    [RewriteLowerLevel] BIT           CONSTRAINT [DF_WebCoreFileList_RewriteLowerLevel] DEFAULT ((0)) NOT NULL,
    [GuestFileContent]  TEXT          NULL,
    [UserFileContent]   TEXT          NULL,
    [AdminFileContent]  TEXT          NULL,
    [ProviderContent]   TEXT          NULL,
    [IsUniquePath]      BIT           CONSTRAINT [DF_WebCoreFileList_IsUniquePath] DEFAULT ((0)) NOT NULL,
    [AutoUpdateOnSave]  BIT           NOT NULL,
    [Active]            BIT           NOT NULL,
    [UserId]            INT           NOT NULL,
    [TimeStamp]         DATETIME2 (7) CONSTRAINT [DF_WebCoreFileList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WebCoreFileList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WebCoreFileList_GlobalUserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_WebCoreFileList] UNIQUE NONCLUSTERED ([FileName] ASC, [SpecificationType] ASC)
);


GO

