USE [DFNB2]
GO

/****** Object:  Table [dbo].[region_dim]    Script Date: 7/11/2020 9:47:04 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[region_dim]') AND type in (N'U'))
DROP TABLE [dbo].[region_dim]
GO

/****** Object:  Table [dbo].[region_dim]    Script Date: 7/11/2020 9:47:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[region_dim](
	[acct_region_id] [int] NOT NULL,
	[branch_id] [smallint] NOT NULL
) ON [PRIMARY]
GO


