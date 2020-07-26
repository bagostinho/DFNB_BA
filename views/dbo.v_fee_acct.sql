USE [DFNB2]
GO

/****** Object:  View [dbo].[v_fee_acct]    Script Date: 7/26/2020 2:45:49 PM ******/
DROP VIEW [dbo].[v_fee_acct]
GO

/****** Object:  View [dbo].[v_fee_acct]    Script Date: 7/26/2020 2:45:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_fee_acct]
AS
(
    SELECT [acct_id], 
           CONVERT(DECIMAL(15, 3), SUM([tran_amt])) AS total_transactions, 
           SUM([tran_fee_amt]) AS total_fees, 
           CONVERT(DECIMAL(3, 2), (SUM([tran_fee_amt]) / SUM([tran_amt]) * 100)) AS percentage
    FROM [dbo].[t_tran_fact]
    GROUP BY [acct_id]
);
GO


