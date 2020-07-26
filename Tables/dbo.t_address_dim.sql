USE [DFNB2]
GO

/****** Object:  Table [dbo].[t_address_dim]    Script Date: 7/26/2020 1:38:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_address_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_address_dim]
GO

/****** Object:  Table [dbo].[t_address_dim]    Script Date: 7/26/2020 1:38:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_address_dim](
	[add_id] [varchar](6) NOT NULL,
	[add_lat] [decimal](16, 12) NULL,
	[add_lon] [decimal](16, 12) NULL,
	[add_type] [char](10) NULL,
 CONSTRAINT [PK_t_address_dim] PRIMARY KEY CLUSTERED 
(
	[add_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


