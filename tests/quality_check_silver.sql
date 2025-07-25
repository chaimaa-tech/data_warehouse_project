/*
===============================================================================
Quality Checks
===============================================================================
Script Purpose:
    This script performs various quality checks for data consistency, accuracy, 
    and standardization across the 'silver' layer. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/
-- ====================================================================
-- checking 'silver.crm_cust_info'
-- ====================================================================
-- check for nulls or duplicates in primary key
-- expectation: no results
select 
    cst_id,
    count(*) 
from silver.crm_cust_info
group by cst_id
having count(*) > 1 or cst_id is null;

-- check for unwanted spaces
-- expectation: no results
select 
    cst_key 
from silver.crm_cust_info
where cst_key != trim(cst_key);

-- data standardization & consistency
select distinct 
    cst_marital_status 
from silver.crm_cust_info;

-- ====================================================================
-- checking 'silver.crm_prd_info'
-- ====================================================================
-- check for nulls or duplicates in primary key
-- expectation: no results
select 
    prd_id,
    count(*) 
from silver.crm_prd_info
group by prd_id
having count(*) > 1 or prd_id is null;

-- check for unwanted spaces
-- expectation: no results
select 
    prd_nm 
from silver.crm_prd_info
where prd_nm != trim(prd_nm);

-- check for nulls or negative values in cost
-- expectation: no results
select 
    prd_cost 
from silver.crm_prd_info
wher
