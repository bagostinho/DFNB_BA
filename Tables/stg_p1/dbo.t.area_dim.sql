USE [DFNB2]
GO

/****** Object:  Table [dbo].[area_dim]    Script Date: 7/11/2020 9:45:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[area_dim]') AND type in (N'U'))
DROP TABLE [dbo].[area_dim]
GO

/****** Object:  Table [dbo].[area_dim]    Script Date: 7/11/2020 9:45:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[area_dim](
	[acct_area_id] [int] NOT NULL,
	[branch_id] [smallint] NOT NULL
) ON [PRIMARY]
GO


