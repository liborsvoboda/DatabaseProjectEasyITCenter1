CREATE TABLE [dbo].[BusinessNotesList] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (50)  NOT NULL,
    [Description] TEXT          NULL,
    [UserId]      INT           NOT NULL,
    [Active]      BIT           CONSTRAINT [DF_NotesList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]   DATETIME2 (7) CONSTRAINT [DF_NotesList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_NotesList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_NotesList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_NotesList] UNIQUE NONCLUSTERED ([Name] ASC)
);


GO

