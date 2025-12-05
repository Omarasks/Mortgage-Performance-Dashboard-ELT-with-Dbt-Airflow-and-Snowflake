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
