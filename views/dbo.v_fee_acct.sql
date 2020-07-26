/*****************************************************************************************************************
NAME:    dbo.v_fee_acct
PURPOSE: Create the dbo.v_fee_acct

SUPPORT: Bruno Agostinho

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       07/25/2020   BAGOSTINHO      1. Built this view


RUNTIME: 
1 min

NOTES: 
The idea is that a small number of load Product Detail Codes were found in more than one source system. 
When we observe these N:N relationships during the recent past the count of Accounts is how we can resolve them.

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

******************************************************************************************************************/
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


