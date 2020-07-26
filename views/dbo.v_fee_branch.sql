/*****************************************************************************************************************
NAME:    dbo.v_fee_branch
PURPOSE: Create the dbo.v_fee_branch

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

/****** Object:  View [dbo].[v_fee_branch]    Script Date: 7/26/2020 2:46:03 PM ******/
DROP VIEW [dbo].[v_fee_branch]
GO

/****** Object:  View [dbo].[v_fee_branch]    Script Date: 7/26/2020 2:46:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_fee_branch]
AS
(
    SELECT bd.branch_desc, 
           CONVERT(DECIMAL(15, 3), SUM(tf.[tran_amt])) AS total_tran, 
           SUM(tf.[tran_fee_amt]) AS total_fees, 
           CONVERT(DECIMAL(3, 2), (SUM(tf.[tran_fee_amt]) / SUM(tf.[tran_amt]) * 100)) AS percentage
    FROM [dbo].[t_tran_fact] AS tf
  JOIN [dbo].[t_branch_dim] AS bd ON tf.branch_id = bd.branch_id
    GROUP BY bd.branch_desc
);
GO


