CREATE TABLE [dbo].[SolutionMixedEnumList] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [ItemsGroup]  VARCHAR (50)  NOT NULL,
    [Name]        VARCHAR (50)  NOT NULL,
    [Description] TEXT          NULL,
    [UserId]      INT           NOT NULL,
    [Active]      BIT           CONSTRAINT [DF_GlobalMixedEnumList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]   DATETIME2 (7) CONSTRAINT [DF_GlobalMixedEnumList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_GlobalMixedEnumList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GlobalMixedEnumList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [FK_SolutionMixedEnumList_SolutionMixedEnumList] FOREIGN KEY ([Id]) REFERENCES [dbo].[SolutionMixedEnumList] ([Id]),
    CONSTRAINT [IX_GlobalMixedEnumList] UNIQUE NONCLUSTERED ([ItemsGroup] ASC, [Name] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_SolutionMixedEnumList]
    ON [dbo].[SolutionMixedEnumList]([ItemsGroup] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_SolutionMixedEnumList_1]
    ON [dbo].[SolutionMixedEnumList]([Name] ASC);


GO

