CREATE TABLE [dbo].[Orders]
(
[OrderID] [int] NOT NULL,
[CustomerID] [int] NULL,
[ProductID] [int] NULL,
[Quantity] [int] NULL,
[OrderDate] [date] NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[trg_CheckOrderQuantity]
ON [dbo].[Orders]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted WHERE Quantity <= 0
    )
    BEGIN
        RAISERROR ('Quantity must be greater than 0.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [PK__Orders__C3905BAF4668337A] PRIMARY KEY CLUSTERED ([OrderID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [FK__Orders__Customer__4E88ABD4] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [FK__Orders__ProductI__4F7CD00D] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ProductID])
GO
