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


