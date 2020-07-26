USE [DFNB2]
GO

/****** Object:  Table [dbo].[t_acct_cust_dim]    Script Date: 7/26/2020 1:34:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_acct_cust_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_acct_cust_dim]
GO

/****** Object:  Table [dbo].[t_acct_cust_dim]    Script Date: 7/26/2020 1:34:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_acct_cust_dim](
	[cust_acct_id] [int] IDENTITY(1,1) NOT NULL,
	[cust_id] [smallint] NOT NULL,
	[acct_id] [int] NOT NULL,
	[acct_cust_role_id] [smallint] NOT NULL,
 CONSTRAINT [PK_t_acct_cust_dim] PRIMARY KEY CLUSTERED 
(
	[cust_acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


