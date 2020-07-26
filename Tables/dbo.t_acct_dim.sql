USE [DFNB2]
GO

ALTER TABLE [dbo].[t_acct_dim] DROP CONSTRAINT [FK_t_acct_dim_t_prod_dim]
GO

ALTER TABLE [dbo].[t_acct_dim] DROP CONSTRAINT [FK_t_acct_dim_t_cust_dim]
GO

ALTER TABLE [dbo].[t_acct_dim] DROP CONSTRAINT [FK_t_acct_dim_t_branch_dim]
GO

/****** Object:  Table [dbo].[t_acct_dim]    Script Date: 7/26/2020 1:36:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_acct_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_acct_dim]
GO

/****** Object:  Table [dbo].[t_acct_dim]    Script Date: 7/26/2020 1:36:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_acct_dim](
	[acct_id] [int] NOT NULL,
	[open_date] [date] NOT NULL,
	[close_date] [date] NOT NULL,
	[open_close_code] [varchar](1) NOT NULL,
	[loan_amt] [decimal](20, 4) NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[prod_id] [smallint] NOT NULL,
	[primary_cust_id] [smallint] NOT NULL,
 CONSTRAINT [PK_t_acct_dim] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_acct_dim]  WITH CHECK ADD  CONSTRAINT [FK_t_acct_dim_t_branch_dim] FOREIGN KEY([branch_id])
REFERENCES [dbo].[t_branch_dim] ([branch_id])
GO

ALTER TABLE [dbo].[t_acct_dim] CHECK CONSTRAINT [FK_t_acct_dim_t_branch_dim]
GO

ALTER TABLE [dbo].[t_acct_dim]  WITH CHECK ADD  CONSTRAINT [FK_t_acct_dim_t_cust_dim] FOREIGN KEY([primary_cust_id])
REFERENCES [dbo].[t_cust_dim] ([cust_id])
GO

ALTER TABLE [dbo].[t_acct_dim] CHECK CONSTRAINT [FK_t_acct_dim_t_cust_dim]
GO

ALTER TABLE [dbo].[t_acct_dim]  WITH CHECK ADD  CONSTRAINT [FK_t_acct_dim_t_prod_dim] FOREIGN KEY([prod_id])
REFERENCES [dbo].[t_prod_dim] ([prod_id])
GO

ALTER TABLE [dbo].[t_acct_dim] CHECK CONSTRAINT [FK_t_acct_dim_t_prod_dim]
GO


