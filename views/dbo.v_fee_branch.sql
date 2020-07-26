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


