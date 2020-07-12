USE [DFNB2]
GO

/****** Object:  Table [dbo].[acct_fact]    Script Date: 7/11/2020 9:44:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[acct_fact]') AND type in (N'U'))
DROP TABLE [dbo].[acct_fact]
GO

/****** Object:  Table [dbo].[acct_fact]    Script Date: 7/11/2020 9:44:45 PM ******/
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


