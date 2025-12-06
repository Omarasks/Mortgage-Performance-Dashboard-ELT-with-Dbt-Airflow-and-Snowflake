with
    dim_borrower as (

        select
            borrower_id,
            age,
            gender,
            marital_status,
            annual_income,
            risk_category,
            employment_status,
        from {{ ref("int_borrower_history") }}
    )
select *
from dim_borrower
