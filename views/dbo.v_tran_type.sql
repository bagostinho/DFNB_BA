USE [DFNB2]
GO

/****** Object:  View [dbo].[v_tran_type]    Script Date: 7/26/2020 2:46:11 PM ******/
DROP VIEW [dbo].[v_tran_type]
GO

/****** Object:  View [dbo].[v_tran_type]    Script Date: 7/26/2020 2:46:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_tran_type]
AS
(
    SELECT ttd.[tran_type_desc], 
           COUNT(tf.[tran_date]) AS number_of_tran, 
           SUM(convert(decimal(15,0),tf.[tran_amt])) AS tran_amt
    FROM [dbo].[t_tran_fact] AS tf
         JOIN [dbo].[t_tran_type_dim] AS ttd ON tf.tran_type_id = ttd.tran_type_id
    GROUP BY ttd.[tran_type_desc]
);
GO


