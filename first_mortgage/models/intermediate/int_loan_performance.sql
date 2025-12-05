with
    loan_performance as (
        select
            l.loan_id,
            l.origination_date,
            l.maturity_date,
            l.loan_amount,
            l.interest_rate,
            l.loan_purpose,
            p.current_balance,
            p.equity_built,
            l.loan_to_value_ratio as ltv,
            {{ ltv_risk("l.loan_to_value_ratio") }} as ltv_risk_category,
        from {{ ref("stg_loan_info") }} as l
        join {{ ref("stg_payment_info") }} as p on l.loan_id = p.loan_id

    )
select *
from loan_performance
