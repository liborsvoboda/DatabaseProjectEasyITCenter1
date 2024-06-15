CREATE TABLE [dbo].[SystemReportQueueList] (
    [Id]                 INT            IDENTITY (1, 1) NOT NULL,
    [Name]               VARCHAR (50)   NOT NULL,
    [Sequence]           INT            NOT NULL,
    [Sql]                NVARCHAR (MAX) NOT NULL,
    [TableName]          VARCHAR (150)  NOT NULL,
    [Filter]             NVARCHAR (MAX) NULL,
    [Search]             VARCHAR (50)   NULL,
    [SearchColumnList]   NVARCHAR (MAX) NULL,
    [SearchFilterIgnore] BIT            CONSTRAINT [DF_ReportQueue_SearchFilterIgnore] DEFAULT ((0)) NOT NULL,
    [RecId]              INT            NULL,
    [RecIdFilterIgnore]  BIT            CONSTRAINT [DF_ReportQueue_RecIdFilterIgnore] DEFAULT ((0)) NOT NULL,
    [Timestamp]          DATETIME2 (7)  CONSTRAINT [DF_ReportQueueList_Timestamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ReportQueue] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [IX_ReportQueue] UNIQUE NONCLUSTERED ([Name] ASC),
    CONSTRAINT [IX_ReportQueueList_1] UNIQUE NONCLUSTERED ([TableName] ASC, [Sequence] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_ReportQueueList]
    ON [dbo].[SystemReportQueueList]([TableName] ASC);


GO

