/*****************************************************************************************************************
NAME:    dbo.v_tran_type
PURPOSE: Create the dbo.v_tran_type

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


