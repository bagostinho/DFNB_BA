/********************************************************************************************
NAME:    data_load
PURPOSE: Load the normalized tables into DFNB2 database and assign keys
SUPPORT: Bruno Agostinho
MODIFICATION LOG:
Ver   Date        Author    Description
---   ----------  -------   -----------------------------------------------------------------
1.0   07/25/2020  BAGOSTINHO   1. Created the Load Script

RUNTIME: 
**
NOTES: 
(None)
LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
********************************************************************************************/

USE [DFNB2];

IF (OBJECT_ID('FK_t_acct_dim_t_cust_dim') IS NOT NULL)
ALTER TABLE t_acct_dim
DROP CONSTRAINT FK_t_acct_dim_t_cust_dim;

IF (OBJECT_ID('FK_t_acct_dim_t_branch_dim') IS NOT NULL)
ALTER TABLE t_acct_dim
DROP CONSTRAINT FK_t_acct_dim_t_branch_dim;

IF (OBJECT_ID('FK_t_acct_dim_t_prod_dim') IS NOT NULL)
ALTER TABLE t_acct_dim
DROP CONSTRAINT FK_t_acct_dim_t_prod_dim;

IF (OBJECT_ID('FK_t_acct_fact_sum_t_acct_dim') IS NOT NULL)
ALTER TABLE t_acct_fact_sum
DROP CONSTRAINT FK_t_acct_fact_sum_t_acct_dim;

IF (OBJECT_ID('FK_t_acct_fact_t_acct_dim') IS NOT NULL)
ALTER TABLE t_acct_fact
DROP CONSTRAINT FK_t_acct_fact_t_acct_dim;

IF (OBJECT_ID('FK_t_branch_dim_t_address_dim') IS NOT NULL)
ALTER TABLE t_branch_dim
DROP CONSTRAINT FK_t_branch_dim_t_address_dim;

IF (OBJECT_ID('FK_t_branch_dim_t_region_dim') IS NOT NULL)
ALTER TABLE t_branch_dim
DROP CONSTRAINT FK_t_branch_dim_t_region_dim;

IF (OBJECT_ID('FK_t_branch_dim_t_area_dim') IS NOT NULL)
ALTER TABLE t_branch_dim
DROP CONSTRAINT FK_t_branch_dim_t_area_dim;

IF (OBJECT_ID('FK_t_acct_cust_dim_t_cust_dim') IS NOT NULL)
ALTER TABLE t_acct_cust_dim
DROP CONSTRAINT FK_t_acct_cust_dim_t_cust_dim;

IF (OBJECT_ID('FK_t_acct_cust_dim_t_acct_dim') IS NOT NULL)
ALTER TABLE t_acct_cust_dim
DROP CONSTRAINT FK_t_acct_cust_dim_t_acct_dim;

IF (OBJECT_ID('FK_t_acct_cust_dim_t_acct_cust_role_dim') IS NOT NULL)
ALTER TABLE t_acct_cust_dim
DROP CONSTRAINT FK_t_acct_cust_dim_t_acct_cust_role_dim;

IF (OBJECT_ID('FK_t_cust_dim_t_address_dim') IS NOT NULL)
ALTER TABLE t_cust_dim
DROP CONSTRAINT FK_t_cust_dim_t_address_dim;

IF (OBJECT_ID('FK_t_cust_dim_t_branch_dim') IS NOT NULL)
ALTER TABLE t_cust_dim
DROP CONSTRAINT FK_t_cust_dim_t_branch_dim;

GO


-- /////////////////////////////////  --

truncate table t_acct_dim
INSERT INTO t_acct_dim
(acct_id, 
 open_date, 
 close_date, 
 open_close_code, 
 loan_amt, 
 primary_cust_id, 
 branch_id, 
 prod_id
)
       SELECT [acct_id], 
              [open_date], 
              [close_date], 
              [open_close_code], 
              [loan_amt], 
              [pri_cust_id], 
              [acct_branch_id], 
              [prod_id]
       FROM [dbo].[stg_p1]
       GROUP BY [acct_id], 
                [open_date], 
                [close_date], 
                [open_close_code], 
                [loan_amt], 
                [pri_cust_id], 
                [acct_branch_id], 
                [prod_id]
       ORDER BY 1; 

-- /////////////////////////////////  --

truncate table t_acct_fact;
INSERT INTO t_acct_fact
(as_of_date, 
 acct_id, 
 cur_bal
)
       SELECT [as_of_date], 
              [acct_id], 
              [cur_bal]
			 
       FROM [dbo].[stg_p1]
	    WHERE [acct_cust_role_id] = 1

       GROUP BY [as_of_date], 
                [acct_id], 
                [cur_bal]
       ORDER BY 2; 

-- /////////////////////////////////  --

truncate table t_acct_fact_sum;
INSERT INTO t_acct_fact_sum
(as_of_date, 
 acct_id, 
 balance
)
       SELECT MAX([as_of_date]), 
              [acct_id], 
              SUM([cur_bal])
       FROM [dbo].[stg_p1]
       GROUP BY [acct_id]
       ORDER BY 2;

-- /////////////////////////////////  --

truncate table t_address_dim;
INSERT INTO t_address_dim
(add_id, 
 add_type, 
 add_lon, 
 add_lat
)
       SELECT [cust_add_id], 
              [cust_add_type], 
              [cust_add_lat], 
              [cust_add_lon]
       FROM [dbo].[stg_p1]
       GROUP BY [cust_add_id], 
                [cust_add_type], 
                [cust_add_lat], 
                [cust_add_lon]
       ORDER BY 1;

INSERT INTO t_address_dim
(add_id, 
 add_type, 
 add_lon, 
 add_lat
)
       SELECT [acct_branch_add_id], 
              [acct_branch_add_type], 
              [acct_branch_add_lat], 
              [acct_branch_add_lon]
       FROM [dbo].[stg_p1]
       GROUP BY [acct_branch_add_id], 
                [acct_branch_add_type], 
                [acct_branch_add_lat], 
                [acct_branch_add_lon]
       ORDER BY 1;

-- /////////////////////////////////  --

truncate table t_area_dim;
INSERT INTO t_area_dim
(area_id
)
       SELECT DISTINCT 
              [acct_area_id]
       FROM [dbo].[stg_p1]
       ORDER BY 1;

-- /////////////////////////////////  --

truncate table t_branch_dim
INSERT INTO t_branch_dim
(branch_id, 
 branch_code, 
 branch_desc, 
 add_id, 
 region_id, 
 area_id
)
       SELECT [branch_id], 
              [acct_branch_code], 
              [acct_branch_desc], 
              [acct_branch_add_id], 
              [acct_region_id], 
              [acct_area_id]
       FROM [dbo].[stg_p1]
       GROUP BY [branch_id], 
                [acct_branch_code], 
                [acct_branch_desc], 
                [acct_branch_add_id], 
                [acct_region_id], 
                [acct_area_id]
       ORDER BY 1, 
                4, 
                5, 
                6;

-- /////////////////////////////////  --

truncate table t_acct_cust_dim
INSERT INTO t_acct_cust_dim
(cust_id, 
 acct_id, 
 acct_cust_role_id
)
       SELECT [cust_id], 
              [acct_id], 
              [acct_cust_role_id]
       FROM [dbo].[stg_p1]
       GROUP BY [cust_id], 
                [acct_id], 
                [acct_cust_role_id]
       ORDER BY 1, 
                2, 
                3;

-- /////////////////////////////////  --

truncate table dbo.t_cust_dim
INSERT INTO dbo.t_cust_dim
(cust_id, 
 last_name, 
 first_name, 
 gender, 
 birth_date, 
 cust_since_date, 
 pri_branch_dist, 
 rel_id, 
 add_id, 
 branch_id
)
       SELECT [cust_id], 
              [last_name], 
              [first_name], 
              [gender], 
              [birth_date], 
              [cust_since_date], 
              [cust_pri_branch_dist], 
              [acct_rel_id], 
              [cust_add_id], 
              [pri_branch_id]
       FROM [dbo].[stg_p1]
       GROUP BY [cust_id], 
                [last_name], 
                [first_name], 
                [gender], 
                [birth_date], 
                [cust_since_date], 
                [cust_pri_branch_dist], 
                [acct_rel_id], 
                [cust_add_id], 
                [pri_branch_id]
       ORDER BY 1, 
                8, 
                9, 
                10;

-- /////////////////////////////////  --

truncate table t_acct_cust_role_dim
INSERT INTO t_acct_cust_role_dim (cust_role_id)
       SELECT DISTINCT
              ([acct_cust_role_id])
       FROM [dbo].[stg_p1]
       ORDER BY 1;
UPDATE t_acct_cust_role_dim
  SET 
      cust_role_desc = CASE
                                  WHEN [cust_role_id] = '1'
                                  THEN 'Primary Customer'
                                  ELSE 'Secondary Customer'
                              END;

-- /////////////////////////////////  --

truncate table t_prod_dim
INSERT INTO t_prod_dim(prod_id)
       SELECT DISTINCT 
              [prod_id]
       FROM [dbo].[stg_p1]
    ORDER BY 1;

-- /////////////////////////////////  --

truncate table t_region_dim
INSERT INTO t_region_dim(region_id)
       SELECT DISTINCT 
              [acct_region_id]
       FROM [dbo].[stg_p1]
    ORDER BY 1;


GO

-- /////////////////////////////////  --

INSERT INTO t_acct_dim
([acct_id], 
 [open_date], 
 [close_date], 
 [open_close_code], 
 [loan_amt], 
 [primary_cust_id], 
 [branch_id], 
 [prod_id]
)
VALUES
('-1', 
 '1900-01-01', 
 '9999-12-31', 
 'O', 
 '0.0000', 
 '-1', 
 '-1', 
 '-1'
);

INSERT INTO t_address_dim
([add_id], 
 [add_type], 
 [add_lat], 
 [add_lon]
)
VALUES
('-1', 
 'U', 
 '0.000000000000', 
 '0.000000000000'
);

INSERT INTO t_area_dim
([area_id],
[area_desc]
)
VALUES
('-1', 
 'unknown'
);

INSERT INTO t_branch_dim
([branch_id], 
 [branch_code], 
 [branch_desc], 
 [add_id], 
 [region_id], 
 [area_id]
)
VALUES
('-1', 
 '--', 
 'unknown', 
 '-1', 
 '-1', 
 '-1'
);

SET IDENTITY_INSERT t_acct_cust_dim ON;

INSERT INTO t_acct_cust_dim
([cust_acct_id], 
 [cust_id], 
 [acct_id], 
 [acct_cust_role_id]
)
VALUES
('-1', 
 '-1', 
 '-1', 
 '-1'
);

SET IDENTITY_INSERT t_acct_cust_dim OFF;

INSERT INTO t_cust_dim
([cust_id], 
 [last_name], 
 [first_name], 
 [gender], 
 [birth_date], 
 [cust_since_date], 
 [pri_branch_dist], 
 [rel_id], 
 [add_id], 
 [branch_id]
)
VALUES
('-1', 
 'unknown', 
 'unknown', 
 'U', 
 '1900-01-01', 
 '1900-01-01', 
 '0.00', 
 '-1', 
 '-1', 
 '-1'
);

INSERT INTO t_acct_cust_role_dim
([cust_role_id], 
 [cust_role_desc]
)
VALUES
('-1', 
 'unknown'
);

INSERT INTO t_prod_dim
([prod_id], 
 [prod_desc]
)
VALUES
('-1', 
 'unknown'
);

INSERT INTO t_region_dim
([region_id], 
 [region_desc]
)
VALUES
('-1', 
 'unknown'
);

-- /////////////////////////////////  --


ALTER TABLE t_acct_dim
ADD CONSTRAINT FK_t_acct_dim_t_cust_dim
FOREIGN KEY( primary_cust_id ) REFERENCES t_cust_dim( cust_id );

ALTER TABLE t_acct_dim
ADD CONSTRAINT FK_t_acct_dim_t_branch_dim
FOREIGN KEY( branch_id ) REFERENCES t_branch_dim( branch_id );

ALTER TABLE t_acct_dim
ADD CONSTRAINT FK_t_acct_dim_t_prod_dim
FOREIGN KEY( prod_id ) REFERENCES t_prod_dim( prod_id );

ALTER TABLE t_acct_fact
ADD CONSTRAINT FK_t_acct_fact_t_acct_dim
FOREIGN KEY( acct_id ) REFERENCES t_acct_dim( acct_id );

ALTER TABLE t_acct_fact_sum
ADD CONSTRAINT FK_t_acct_fact_sum_t_acct_dim
FOREIGN KEY( acct_id ) REFERENCES t_acct_dim( acct_id );

--????????????--

ALTER TABLE t_branch_dim
ADD CONSTRAINT FK_t_branch_dim_t_address_dim
FOREIGN KEY( add_id ) REFERENCES t_address_dim( add_id );

--????????????--

ALTER TABLE t_branch_dim
ADD CONSTRAINT FK_t_branch_dim_t_region_dim
FOREIGN KEY( region_id ) REFERENCES t_region_dim( region_id );

ALTER TABLE t_branch_dim
ADD CONSTRAINT FK_t_branch_dim_t_area_dim
FOREIGN KEY( area_id ) REFERENCES t_area_dim( area_id );

ALTER TABLE t_acct_cust_dim
ADD CONSTRAINT FK_t_acct_cust_dim_t_cust_dim
FOREIGN KEY( cust_id ) REFERENCES t_cust_dim( cust_id );

ALTER TABLE t_acct_cust_dim
ADD CONSTRAINT FK_t_acct_cust_dim_t_acct_dim
FOREIGN KEY( acct_id ) REFERENCES t_acct_dim( acct_id );

ALTER TABLE t_acct_cust_dim
ADD CONSTRAINT FK_t_acct_cust_dim_t_acct_cust_role_dim
FOREIGN KEY( cust_role_id ) REFERENCES t_acct_cust_role_dim( cust_role_id );

ALTER TABLE t_cust_dim
ADD CONSTRAINT FK_t_cust_dim_t_address_dim
FOREIGN KEY( address_id ) REFERENCES t_address_dim( address_id );

ALTER TABLE t_cust_dim
ADD CONSTRAINT FK_t_cust_dim_t_branch_dim
FOREIGN KEY( primary_branch_id ) REFERENCES t_branch_dim( branch_id );