CREATE TABLE [dbo].[TemplateList] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [GroupId]     INT           NOT NULL,
    [Sequence]    INT           NOT NULL,
    [Name]        VARCHAR (50)  NOT NULL,
    [Description] TEXT          NULL,
    [UserId]      INT           NOT NULL,
    [Default]     BIT           NOT NULL,
    [Active]      BIT           CONSTRAINT [DF_TemplateList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]   DATETIME2 (7) CONSTRAINT [DF_TemplateList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_TemplateList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TemplateList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [FK_TemplateList_UserRoleList] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[SolutionUserRoleList] ([Id]),
    CONSTRAINT [IX_TemplateList] UNIQUE NONCLUSTERED ([Name] ASC)
);


GO

