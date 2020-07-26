USE [DFNB2]
GO

/****** Object:  Table [dbo].[t_cust_dim]    Script Date: 7/26/2020 1:40:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_cust_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_cust_dim]
GO

/****** Object:  Table [dbo].[t_cust_dim]    Script Date: 7/26/2020 1:40:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_cust_dim](
	[cust_id] [smallint] NOT NULL,
	[last_name] [varchar](100) NOT NULL,
	[first_name] [varchar](100) NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[birth_date] [date] NOT NULL,
	[cust_since_date] [date] NOT NULL,
	[pri_branch_dist] [decimal](7, 2) NOT NULL,
	[rel_id] [smallint] NOT NULL,
	[add_id] [int] NOT NULL,
	[branch_id] [smallint] NOT NULL,
 CONSTRAINT [PK_t_cust_dim] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


