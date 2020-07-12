USE [DFNB2]
GO

/****** Object:  Table [dbo].[acct_dim]    Script Date: 7/11/2020 9:44:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[acct_dim]') AND type in (N'U'))
DROP TABLE [dbo].[acct_dim]
GO

/****** Object:  Table [dbo].[acct_dim]    Script Date: 7/11/2020 9:44:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[acct_dim](
	[acct_id] [int] NOT NULL,
	[open_date] [date] NOT NULL,
	[close_date] [date] NOT NULL,
	[open_close_code] [varchar](1) NOT NULL,
	[loan_amt] [decimal](20, 4) NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[prod_id] [smallint] NOT NULL
) ON [PRIMARY]
GO


