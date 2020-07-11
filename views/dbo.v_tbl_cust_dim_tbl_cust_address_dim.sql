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


