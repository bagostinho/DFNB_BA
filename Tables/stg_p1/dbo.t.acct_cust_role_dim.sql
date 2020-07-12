USE [DFNB2]
GO

/****** Object:  Table [dbo].[acct_cust_role_dim]    Script Date: 7/11/2020 9:43:48 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[acct_cust_role_dim]') AND type in (N'U'))
DROP TABLE [dbo].[acct_cust_role_dim]
GO

/****** Object:  Table [dbo].[acct_cust_role_dim]    Script Date: 7/11/2020 9:43:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[acct_cust_role_dim](
	[acct_cust_role_id] [smallint] NOT NULL
) ON [PRIMARY]
GO


