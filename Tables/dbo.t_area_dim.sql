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

/****** Object:  Table [dbo].[t_area_dim]    Script Date: 7/11/2020 9:45:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_area_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_area_dim]
GO

/****** Object:  Table [dbo].[t_area_dim]    Script Date: 7/11/2020 9:45:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_area_dim](
	[acct_area_id] [int] NOT NULL,
	[branch_id] [smallint] NOT NULL
) ON [PRIMARY]
GO


