USE [DFNB2]
GO

/****** Object:  Table [dbo].[t_branch_dim]    Script Date: 7/26/2020 1:39:20 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_branch_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_branch_dim]
GO

/****** Object:  Table [dbo].[t_branch_dim]    Script Date: 7/26/2020 1:39:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_branch_dim](
	[branch_id] [smallint] NOT NULL,
	[branch_code] [varchar](5) NOT NULL,
	[branch_desc] [varchar](100) NOT NULL,
	[add_id] [int] NOT NULL,
	[region_id] [int] NOT NULL,
	[area_id] [int] NOT NULL,
 CONSTRAINT [PK_t_branch_dim] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


