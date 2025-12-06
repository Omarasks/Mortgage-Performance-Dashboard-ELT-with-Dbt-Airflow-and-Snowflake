-- FUNCTION TO SEGMENT CREDIT SCORES 
{% macro credit_score_tier() %}

case
    when credit_score >= 740
    then 'prime'
    when credit_score between 670 and 739
    then 'Near-prime'
    else 'subprime'
end

{% endmacro %}

-- FUNCTION TO SEGMENT LTV 
{% macro ltv_risk(x) %}

case
    when ({{ x }}) >= 90
    then 'High risk'
    when ({{ x }}) >= 80
    then 'Medium risk'
    else 'Low risk'
end
{% endmacro %}

-- FUNCTION TO FIND MONTH SINCE LOAN ORIGINATION 
{% macro month_since_origination() %}
datediff(year, origination_date, maturity_date)
{% endmacro %}

-- FUNCTION TO FIND IF IS_CANDIDATE_PRIME 
{% macro is_candidate_prime(x, y) %}

case when {{ (x) }} >= 740 and {{ (y) }} = 'Current' then 'AAA' else 'BB+' end

{% endmacro %}

-- FUNCTION TO CALCULATE DPD 
{% macro day_past_due(x) %}

case
    when {{ (x) }} = 0
    then 'current'
    when {{ (x) }} between 1 and 29
    then 'grace period'
    when {{ (x) }} between 30 and 59
    then '30 DPD'
    when {{ (x) }} between 60 and 89
    then '60 DPD'
    when {{ (x) }} >= 90
    then '90 DPD'
    else 'foreclosure'
end

{% endmacro %}
