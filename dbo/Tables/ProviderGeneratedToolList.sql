CREATE TABLE [dbo].[ProviderGeneratedToolList] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (50)  NOT NULL,
    [Description] TEXT          NULL,
    [UserId]      INT           NOT NULL,
    [Rating]      INT           NULL,
    [DescActive]  BIT           NOT NULL,
    [TimeStamp]   DATETIME2 (7) CONSTRAINT [DF_GeneratedToolList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_GeneratedToolList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GeneratedToolList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id])
);


GO

CREATE NONCLUSTERED INDEX [IX_GeneratedToolList]
    ON [dbo].[ProviderGeneratedToolList]([Name] ASC, [UserId] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_GeneratedToolList_2]
    ON [dbo].[ProviderGeneratedToolList]([UserId] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_GeneratedToolList_1]
    ON [dbo].[ProviderGeneratedToolList]([Name] ASC);


GO

