USE [DFNB2]
GO

/****** Object:  Table [dbo].[cust_address_dim]    Script Date: 7/11/2020 9:45:52 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cust_address_dim]') AND type in (N'U'))
DROP TABLE [dbo].[cust_address_dim]
GO

/****** Object:  Table [dbo].[cust_address_dim]    Script Date: 7/11/2020 9:45:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[cust_address_dim](
	[cust_add_id] [int] NOT NULL,
	[cust_lat] [decimal](16, 12) NOT NULL,
	[cust_lon] [decimal](16, 12) NOT NULL
) ON [PRIMARY]
GO


