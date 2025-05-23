CREATE TABLE [Sales].[Customers]
(
[CustomerID] [int] NOT NULL,
[Name] [nvarchar] (100) COLLATE Cyrillic_General_CI_AS NOT NULL,
[Email] [nvarchar] (100) COLLATE Cyrillic_General_CI_AS NOT NULL,
[Phone] [nvarchar] (20) COLLATE Cyrillic_General_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Create trigger
CREATE TRIGGER [Sales].[trg_Customers_Insert]
ON [Sales].[Customers]
AFTER INSERT
AS
BEGIN
    PRINT 'New customer inserted';
END;
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [Sales].[trg_Customers_SimpleMsg]
ON [Sales].[Customers]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    PRINT 'Customers table changed';
END;
GO
ALTER TABLE [Sales].[Customers] ADD CONSTRAINT [CHK_Email] CHECK (([Email] like '%@%'))
GO
ALTER TABLE [Sales].[Customers] ADD CONSTRAINT [PK__Customer__A4AE64B8F9E2427F] PRIMARY KEY CLUSTERED ([CustomerID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Customers_Email] ON [Sales].[Customers] ([Email]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Customer information', 'SCHEMA', N'Sales', 'TABLE', N'Customers', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Index for quick search by Email', 'SCHEMA', N'Sales', 'TABLE', N'Customers', 'INDEX', N'IX_Customers_Email'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Prints message after customer insert', 'SCHEMA', N'Sales', 'TABLE', N'Customers', 'TRIGGER', N'trg_Customers_Insert'
GO
