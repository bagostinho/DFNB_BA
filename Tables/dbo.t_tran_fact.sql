USE [DFNB2]
GO

/****** Object:  Table [dbo].[t_tran_fact]    Script Date: 7/26/2020 1:41:47 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_tran_fact]') AND type in (N'U'))
DROP TABLE [dbo].[t_tran_fact]
GO

/****** Object:  Table [dbo].[t_tran_fact]    Script Date: 7/26/2020 1:41:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_tran_fact](
	[tran_date] [date] NOT NULL,
	[tran_time] [time](7) NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[acct_id] [int] NOT NULL,
	[tran_type_id] [smallint] NOT NULL,
	[tran_amt] [int] NOT NULL,
	[tran_fee_amt] [decimal](15, 3) NOT NULL
) ON [PRIMARY]
GO


