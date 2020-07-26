USE [DFNB2]
GO

/****** Object:  Table [dbo].[t_area_dim]    Script Date: 7/26/2020 1:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_area_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_area_dim]
GO

/****** Object:  Table [dbo].[t_area_dim]    Script Date: 7/26/2020 1:38:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_area_dim](
	[area_id] [int] NOT NULL,
	[area_desc] [varchar](50) NULL,
 CONSTRAINT [PK_t_area_dim] PRIMARY KEY CLUSTERED 
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


