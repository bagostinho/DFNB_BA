USE [DFNB2]
GO

ALTER TABLE [dbo].[t_acct_fact] DROP CONSTRAINT [FK_t_acct_fact_t_acct_dim]
GO

/****** Object:  Table [dbo].[t_acct_fact]    Script Date: 7/26/2020 1:36:47 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_acct_fact]') AND type in (N'U'))
DROP TABLE [dbo].[t_acct_fact]
GO

/****** Object:  Table [dbo].[t_acct_fact]    Script Date: 7/26/2020 1:36:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_acct_fact](
	[acct_id] [int] NOT NULL,
	[cur_bal] [decimal](20, 4) NOT NULL,
	[as_of_date] [date] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_acct_fact]  WITH CHECK ADD  CONSTRAINT [FK_t_acct_fact_t_acct_dim] FOREIGN KEY([acct_id])
REFERENCES [dbo].[t_acct_dim] ([acct_id])
GO

ALTER TABLE [dbo].[t_acct_fact] CHECK CONSTRAINT [FK_t_acct_fact_t_acct_dim]
GO


