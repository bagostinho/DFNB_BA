USE [DFNB2]
GO

/****** Object:  Table [dbo].[t_acct_cust_role_dim]    Script Date: 7/26/2020 1:35:37 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_acct_cust_role_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_acct_cust_role_dim]
GO

/****** Object:  Table [dbo].[t_acct_cust_role_dim]    Script Date: 7/26/2020 1:35:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_acct_cust_role_dim](
	[cust_role_id] [smallint] NOT NULL,
	[cust_role_desc] [varchar](100) NULL,
 CONSTRAINT [PK_t_acct_cust_role_dim] PRIMARY KEY CLUSTERED 
(
	[cust_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


