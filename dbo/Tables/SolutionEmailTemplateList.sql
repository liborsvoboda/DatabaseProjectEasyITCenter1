CREATE TABLE [dbo].[SolutionEmailTemplateList] (
    [Id]               INT           IDENTITY (1, 1) NOT NULL,
    [SystemLanguageId] INT           NOT NULL,
    [TemplateName]     VARCHAR (50)  NOT NULL,
    [Variables]        TEXT          NOT NULL,
    [Subject]          VARCHAR (255) NOT NULL,
    [Email]            TEXT          NULL,
    [UserId]           INT           NOT NULL,
    [TimeStamp]        DATETIME2 (7) CONSTRAINT [DF_EmailTemplateList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_EmailTemplateList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EmailTemplateList_SystemLanguageList] FOREIGN KEY ([SystemLanguageId]) REFERENCES [dbo].[SolutionLanguageList] ([Id]),
    CONSTRAINT [FK_EmailTemplateList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_EmailTemplateList] UNIQUE NONCLUSTERED ([SystemLanguageId] ASC, [TemplateName] ASC)
);


GO

