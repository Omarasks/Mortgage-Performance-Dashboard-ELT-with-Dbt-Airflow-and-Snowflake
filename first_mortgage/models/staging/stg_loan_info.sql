with
    loan_info as (
        select
            loan_id as loan_id,
            origination_date::date as origination_date,
            maturity_date::date as maturity_date,
            loan_amount::integer as loan_amount,
            property_value::integer as property_value,
            loan_term::integer as loan_duration,
            state as state_location,
            interest_rate::float as interest_rate,
            loan_to_value_ratio::float as loan_to_value_ratio,
            loan_purpose as loan_purpose,
            loan_type as loan_type
        from {{ ref("stg_mortgage_raw") }}
    )
select *
from loan_info
