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

/****** Object:  View [dbo].[tbl_acct_dim_tbl_branch_dim]    Script Date: 7/11/2020 2:35:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[tbl_acct_dim_tbl_branch_dim] AS 
SELECT c.acct_id, c.prod_id, c.branch_id, c.pri_cust_id, c.open_date, c.close_date, a.acct_region_id, a.acct_area_id, a.acct_branch_add_id, a.acct_branch_code, a.acct_branch_desc
FROM     acct_dim AS c LEFT OUTER JOIN
                  branch_dim AS a ON c.branch_id = a.branch_id
GO


