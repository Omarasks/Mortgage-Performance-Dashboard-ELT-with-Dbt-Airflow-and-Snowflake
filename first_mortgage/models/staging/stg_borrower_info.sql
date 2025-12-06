with
    borrower_info as (
        select
            borrower_id as borrower_id,
            age as age,
            gender as gender,
            marital_status as marital_status,
            employment_status as employment_status,
            annual_income as annual_income


        from {{ ref("stg_mortgage_raw") }}
    )
select *
from borrower_info
