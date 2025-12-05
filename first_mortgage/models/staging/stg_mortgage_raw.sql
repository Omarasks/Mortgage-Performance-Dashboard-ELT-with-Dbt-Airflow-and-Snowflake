with
    mortgage_raw as (
        select *
        from {{ source("first_mortgage", "first_mortgage_table") }}
        where borrower_id != 'Borrower_ID'
    )
select *
from mortgage_raw
