USE [DFNB2]
GO

/****** Object:  Table [dbo].[branch_dim]    Script Date: 7/11/2020 9:45:29 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[branch_dim]') AND type in (N'U'))
DROP TABLE [dbo].[branch_dim]
GO

/****** Object:  Table [dbo].[branch_dim]    Script Date: 7/11/2020 9:45:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[branch_dim](
	[branch_id] [smallint] NOT NULL,
	[acct_region_id] [int] NOT NULL,
	[acct_area_id] [int] NOT NULL,
	[acct_branch_add_id] [int] NOT NULL,
	[acct_branch_code] [varchar](5) NOT NULL,
	[acct_branch_desc] [varchar](100) NOT NULL
) ON [PRIMARY]
GO


