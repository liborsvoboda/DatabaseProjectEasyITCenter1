CREATE TABLE [dbo].[SolutionMessageTypeList] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [Name]          VARCHAR (50)  NOT NULL,
    [Variables]     TEXT          NULL,
    [AnswerAllowed] BIT           CONSTRAINT [DF_SolutionMessageTypeList_AnswerEnabled] DEFAULT ((0)) NOT NULL,
    [IsSystemOnly]  BIT           CONSTRAINT [DF_SolutionMessageTypeList_IsSystemOnly] DEFAULT ((0)) NOT NULL,
    [Description]   TEXT          NULL,
    [UserId]        INT           NOT NULL,
    [TimeStamp]     DATETIME2 (7) CONSTRAINT [DF_SolutionMessageTypeList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SolutionMessageTypeList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SolutionMessageTypeList_SolutionUserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_SolutionMessageTypeList] UNIQUE NONCLUSTERED ([Name] ASC)
);


GO

