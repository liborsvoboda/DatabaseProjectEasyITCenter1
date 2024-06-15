CREATE TABLE [dbo].[SolutionUserRoleList] (
    [Id]                 INT           IDENTITY (1, 1) NOT NULL,
    [SystemName]         VARCHAR (50)  NOT NULL,
    [MinimalAccessValue] INT           CONSTRAINT [DF_SolutionUserRoleList_SequenceAccessNumber] DEFAULT ((0)) NOT NULL,
    [Description]        TEXT          NULL,
    [UserId]             INT           NULL,
    [Timestamp]          DATETIME2 (7) CONSTRAINT [DF_UserRoleList_timestamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_UserRoleList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [IX_UserRoleList] UNIQUE NONCLUSTERED ([SystemName] ASC)
);


GO

