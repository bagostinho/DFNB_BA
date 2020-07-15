/*****************************************************************************************************************
NAME:    LoadDFNB_p1.sql
PURPOSE: Load DFNB Project 1


MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       7/11/2020   BAGOSTINHO      1. Built this script  for LDS BC IT 240


NOTES: 
This script is for Project 1

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

******************************************************************************************************************/

USE [DFNB2]
GO

/****** Object:  View [dbo].[tbl_acct_dim_tbl_acct_fact]    Script Date: 7/11/2020 2:32:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[tbl_acct_dim_tbl_acct_fact] AS
SELECT DISTINCT d.acct_id, as_of_date, cur_bal, open_date, close_date, open_close_code, loan_amt, branch_id, prod_id
FROM     acct_dim d
LEFT JOIN acct_fact AS af ON d.acct_id = af.acct_id

GO


