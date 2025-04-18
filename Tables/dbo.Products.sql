CREATE TABLE [dbo].[Products]
(
[ProductID] [int] NOT NULL,
[ProductName] [nvarchar] (100) COLLATE Cyrillic_General_CI_AS NULL,
[Price] [decimal] (10, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [PK__Products__B40CC6EDFF36E89E] PRIMARY KEY CLUSTERED ([ProductID]) ON [PRIMARY]
GO
