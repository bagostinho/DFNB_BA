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


