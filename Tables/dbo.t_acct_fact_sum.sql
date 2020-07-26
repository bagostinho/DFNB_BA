USE [DFNB2]
GO

ALTER TABLE [dbo].[t_acct_fact_sum] DROP CONSTRAINT [FK_t_acct_fact_sum_t_acct_dim]
GO

/****** Object:  Table [dbo].[t_acct_fact_sum]    Script Date: 7/26/2020 1:37:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_acct_fact_sum]') AND type in (N'U'))
DROP TABLE [dbo].[t_acct_fact_sum]
GO

/****** Object:  Table [dbo].[t_acct_fact_sum]    Script Date: 7/26/2020 1:37:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_acct_fact_sum](
	[as_of_date] [date] NOT NULL,
	[acct_id] [int] NOT NULL,
	[balance] [numeric](18, 0) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_acct_fact_sum]  WITH CHECK ADD  CONSTRAINT [FK_t_acct_fact_sum_t_acct_dim] FOREIGN KEY([acct_id])
REFERENCES [dbo].[t_acct_dim] ([acct_id])
GO

ALTER TABLE [dbo].[t_acct_fact_sum] CHECK CONSTRAINT [FK_t_acct_fact_sum_t_acct_dim]
GO


