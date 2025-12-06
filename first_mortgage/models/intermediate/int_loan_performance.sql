with
    loan_performance as (
        select
            l.loan_id,
            p.borrower_id,
            l.state_location,
            l.loan_type,
            l.origination_date,
            l.maturity_date,
            l.loan_amount,
            l.interest_rate,
            l.loan_duration,
            l.loan_purpose,
            p.credit_score,
            p.payment_status,
            p.current_balance,
            p.monthly_payment,
            p.equity_built,
            p.default_flag,
            p.days_delinquent,
            l.loan_to_value_ratio as ltv,
            {{ ltv_risk("l.loan_to_value_ratio") }} as ltv_risk_category,
            {{ is_candidate_prime("credit_Score", "payment_status") }}
            as credit_risk_category,
            {{ day_past_due("days_delinquent") }} as day_past_due
        from {{ ref("stg_loan_info") }} as l
        join {{ ref("stg_payment_info") }} as p on l.loan_id = p.loan_id

    )
select *
from loan_performance
