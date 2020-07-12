USE [DFNB2]
GO

/****** Object:  Table [dbo].[prod_dim]    Script Date: 7/11/2020 9:46:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[prod_dim]') AND type in (N'U'))
DROP TABLE [dbo].[prod_dim]
GO

/****** Object:  Table [dbo].[prod_dim]    Script Date: 7/11/2020 9:46:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[prod_dim](
	[prod_id] [smallint] NOT NULL
) ON [PRIMARY]
GO


