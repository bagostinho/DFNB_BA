USE [DFNB2]
GO
/****** Object:  Table [dbo].[region_dim]    Script Date: 7/15/2020 4:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[region_dim]') AND type in (N'U'))
DROP TABLE [dbo].[region_dim]
GO
/****** Object:  Table [dbo].[prod_dim]    Script Date: 7/15/2020 4:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[prod_dim]') AND type in (N'U'))
DROP TABLE [dbo].[prod_dim]
GO
/****** Object:  Table [dbo].[cust_dim]    Script Date: 7/15/2020 4:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cust_dim]') AND type in (N'U'))
DROP TABLE [dbo].[cust_dim]
GO
/****** Object:  Table [dbo].[cust_address_dim]    Script Date: 7/15/2020 4:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cust_address_dim]') AND type in (N'U'))
DROP TABLE [dbo].[cust_address_dim]
GO
/****** Object:  Table [dbo].[branch_dim]    Script Date: 7/15/2020 4:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[branch_dim]') AND type in (N'U'))
DROP TABLE [dbo].[branch_dim]
GO
/****** Object:  Table [dbo].[area_dim]    Script Date: 7/15/2020 4:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[area_dim]') AND type in (N'U'))
DROP TABLE [dbo].[area_dim]
GO
/****** Object:  Table [dbo].[acct_cust_role_dim]    Script Date: 7/15/2020 4:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[acct_cust_role_dim]') AND type in (N'U'))
DROP TABLE [dbo].[acct_cust_role_dim]
GO
/****** Object:  Table [dbo].[acct_cust_dim]    Script Date: 7/15/2020 4:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[acct_cust_dim]') AND type in (N'U'))
DROP TABLE [dbo].[acct_cust_dim]
GO
/****** Object:  View [dbo].[tbl_acct_dim_tbl_acct_fact]    Script Date: 7/15/2020 4:22:56 PM ******/
DROP VIEW [dbo].[tbl_acct_dim_tbl_acct_fact]
GO
/****** Object:  Table [dbo].[acct_dim]    Script Date: 7/15/2020 4:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[acct_dim]') AND type in (N'U'))
DROP TABLE [dbo].[acct_dim]
GO
/****** Object:  Table [dbo].[acct_fact]    Script Date: 7/15/2020 4:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[acct_fact]') AND type in (N'U'))
DROP TABLE [dbo].[acct_fact]
GO
/****** Object:  Table [dbo].[acct_fact]    Script Date: 7/15/2020 4:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_fact](
	[acct_id] [int] NOT NULL,
	[cust_id] [smallint] NOT NULL,
	[cur_bal] [decimal](20, 4) NOT NULL,
	[as_of_date] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_dim]    Script Date: 7/15/2020 4:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_dim](
	[acct_id] [int] NOT NULL,
	[open_date] [date] NOT NULL,
	[close_date] [date] NOT NULL,
	[open_close_code] [varchar](1) NOT NULL,
	[loan_amt] [decimal](20, 4) NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[prod_id] [smallint] NOT NULL,
 CONSTRAINT [PK_acct_dim] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tbl_acct_dim_tbl_acct_fact]    Script Date: 7/15/2020 4:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tbl_acct_dim_tbl_acct_fact] AS
SELECT DISTINCT d.acct_id, as_of_date, cur_bal, open_date, close_date, open_close_code, loan_amt, branch_id, prod_id
FROM     acct_dim d
LEFT JOIN acct_fact AS af ON d.acct_id = af.acct_id

GO
/****** Object:  Table [dbo].[acct_cust_dim]    Script Date: 7/15/2020 4:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_cust_dim](
	[acct_id] [int] NOT NULL,
	[cust_id] [smallint] NOT NULL,
	[acct_cust_role_id] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_cust_role_dim]    Script Date: 7/15/2020 4:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_cust_role_dim](
	[acct_cust_role_id] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[area_dim]    Script Date: 7/15/2020 4:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[area_dim](
	[acct_area_id] [int] NOT NULL,
	[branch_id] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[branch_dim]    Script Date: 7/15/2020 4:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[branch_dim](
	[branch_id] [smallint] NOT NULL,
	[acct_region_id] [int] NOT NULL,
	[acct_area_id] [int] NOT NULL,
	[acct_branch_add_id] [int] NOT NULL,
	[acct_branch_code] [varchar](5) NOT NULL,
	[acct_branch_desc] [varchar](100) NOT NULL,
 CONSTRAINT [PK_branch_dim] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cust_address_dim]    Script Date: 7/15/2020 4:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cust_address_dim](
	[cust_add_id] [int] NOT NULL,
	[cust_lat] [decimal](16, 12) NOT NULL,
	[cust_lon] [decimal](16, 12) NOT NULL,
 CONSTRAINT [PK_cust_address_dim] PRIMARY KEY CLUSTERED 
(
	[cust_add_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cust_dim]    Script Date: 7/15/2020 4:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cust_dim](
	[cust_id] [smallint] NOT NULL,
	[last_name] [varchar](100) NOT NULL,
	[first_name] [varchar](100) NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[birth_date] [date] NOT NULL,
	[cust_rel_id] [smallint] NOT NULL,
	[cust_add_id] [int] NOT NULL,
	[branch_id] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prod_dim]    Script Date: 7/15/2020 4:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prod_dim](
	[prod_id] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[region_dim]    Script Date: 7/15/2020 4:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[region_dim](
	[acct_region_id] [int] NOT NULL,
	[branch_id] [smallint] NOT NULL
) ON [PRIMARY]
GO
