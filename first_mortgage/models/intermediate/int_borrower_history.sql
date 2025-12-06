with
    borrower_history as (
        select
            b.borrower_id,
            p.loan_id,
            b.age,
            b.gender,
            b.marital_status,
            b.employment_status,
            b.annual_income,
            p.monthly_payment,
            p.default_flag,
            {{ credit_score_tier() }} as risk_category
        from {{ ref("stg_borrower_info") }} as b
        join {{ ref("stg_payment_info") }} as p on b.borrower_id = p.borrower_id
    )
select *
from borrower_history
