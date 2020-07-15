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

/****** Object:  View [dbo].[tbl_cust_dim_tbl_cust_address_dim]    Script Date: 7/11/2020 2:36:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[tbl_cust_dim_tbl_cust_address_dim] AS 
SELECT c.cust_id, c.last_name, c.first_name, c.gender, c.birth_date, c.cust_rel_id, c.cust_add_id, c.branch_id, a.cust_lat, a.cust_lon
FROM     cust_dim AS c LEFT OUTER JOIN
                  cust_address_dim AS a ON c.cust_add_id = a.cust_add_id
GO


