CREATE TABLE [dbo].[Customers]
(
[CustomerID] [int] NOT NULL,
[FirstName] [nvarchar] (50) COLLATE Cyrillic_General_CI_AS NULL,
[LastName] [nvarchar] (50) COLLATE Cyrillic_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers] ADD CONSTRAINT [PK__Customer__A4AE64B814506075] PRIMARY KEY CLUSTERED ([CustomerID]) ON [PRIMARY]
GO
