with
    payment_info as (
        select
            borrower_id as borrower_id,
            loan_id as loan_id,
            payment_status as payment_status,
            current_balance::float as current_balance,
            monthly_payment::float as monthly_payment,
            days_delinquent::integer as days_delinquent,
            default_flag::integer as default_flag,
            payment_to_income_ratio::float as payment_to_income_ratio,
            equity_built::float as equity_built

        from {{ ref("stg_mortgage_raw") }}
    )
select *
from payment_info
