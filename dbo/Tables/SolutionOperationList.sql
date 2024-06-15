CREATE TABLE [dbo].[SolutionOperationList] (
    [Id]                      INT           IDENTITY (1, 1) NOT NULL,
    [InheritedTypeName]       VARCHAR (50)  NOT NULL,
    [Name]                    VARCHAR (255) NOT NULL,
    [InputData]               TEXT          NOT NULL,
    [InheritedResultTypeName] VARCHAR (50)  NOT NULL,
    [Description]             TEXT          NULL,
    [UserId]                  INT           NOT NULL,
    [Active]                  BIT           CONSTRAINT [DF_SolutionOperationList_Active] DEFAULT ((1)) NOT NULL,
    [TimeStamp]               DATETIME2 (7) CONSTRAINT [DF_SolutionOperationList_TimeStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SolutionOperationList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SolutionOperationList_UserList] FOREIGN KEY ([UserId]) REFERENCES [dbo].[SolutionUserList] ([Id]),
    CONSTRAINT [IX_SolutionOperationList] UNIQUE NONCLUSTERED ([Name] ASC)
);


GO

