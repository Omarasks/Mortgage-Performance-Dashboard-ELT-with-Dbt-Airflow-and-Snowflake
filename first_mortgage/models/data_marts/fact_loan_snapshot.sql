with
    fact_loan_snapshot as (

        select
            concat(loan_id, borrower_id) as loan_key,
            loan_id,
            borrower_id,
            current_balance,
            payment_status,
            days_delinquent,
            default_flag,
            monthly_payment,
            equity_built,
            ltv_risk_category,
            credit_risk_category,
            day_past_due
        from {{ ref("int_loan_performance") }}
    )
select *
from fact_loan_snapshot
