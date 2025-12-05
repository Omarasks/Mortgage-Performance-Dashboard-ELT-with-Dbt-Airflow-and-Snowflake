with
    borrower_history as (
        select
            b.borrower_id,
            b.age,
            b.annual_income,
            b.credit_score,
            p.payment_status,
            p.days_delinquent,
            {{ credit_score_tier() }} as risk_category
        from {{ ref("stg_borrower_info") }} as b
        join {{ ref("stg_payment_info") }} as p on b.borrower_id = p.borrower_id
    )
select *
from borrower_history
