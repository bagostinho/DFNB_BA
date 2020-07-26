USE [DFNB2]
GO

/****** Object:  Table [dbo].[t_prod_dim]    Script Date: 7/26/2020 1:40:54 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_prod_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_prod_dim]
GO

/****** Object:  Table [dbo].[t_prod_dim]    Script Date: 7/26/2020 1:40:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_prod_dim](
	[prod_id] [smallint] NOT NULL,
	[prod_desc] [varchar](50) NULL,
 CONSTRAINT [PK_t_prod_dim] PRIMARY KEY CLUSTERED 
(
	[prod_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


