USE [DFNB2]
GO

/****** Object:  Table [dbo].[cust_dim]    Script Date: 7/11/2020 9:46:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cust_dim]') AND type in (N'U'))
DROP TABLE [dbo].[cust_dim]
GO

/****** Object:  Table [dbo].[cust_dim]    Script Date: 7/11/2020 9:46:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[cust_dim](
	[cust_id] [smallint] NOT NULL,
	[last_name] [varchar](100) NOT NULL,
	[first_name] [varchar](100) NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[birth_date] [date] NOT NULL,
	[cust_rel_id] [smallint] NOT NULL,
	[cust_add_id] [int] NOT NULL,
	[branch_id] [smallint] NOT NULL
) ON [PRIMARY]
GO


