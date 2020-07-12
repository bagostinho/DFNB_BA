USE [DFNB2]
GO

/****** Object:  Table [dbo].[acct_cust_dim]    Script Date: 7/11/2020 9:42:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[acct_cust_dim]') AND type in (N'U'))
DROP TABLE [dbo].[acct_cust_dim]
GO

/****** Object:  Table [dbo].[acct_cust_dim]    Script Date: 7/11/2020 9:42:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[acct_cust_dim](
	[acct_id] [int] NOT NULL,
	[cust_id] [smallint] NOT NULL,
	[acct_cust_role_id] [smallint] NOT NULL
) ON [PRIMARY]
GO


