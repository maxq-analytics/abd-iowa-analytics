with stores as (
  select distinct store_id
  from {{ ref('stg_invoices') }}
),
stamped as (
  select
    store_id,
    ntile(15) over (order by store_id) as stamp
  from stores
)
select
  store_id,
  stamp,
  case 
    when stamp = 1 then 29653791881
    when stamp = 2 then 22511819908
    when stamp = 3 then 21243328892
    when stamp = 4 then 17698081060
    when stamp = 5 then 17697925996
    when stamp = 6 then 17696780062
    when stamp = 7 then 17184361585
    when stamp = 8 then 15130406455
    when stamp = 9 then 14867649666
    when stamp = 10 then 10190660121
    when stamp = 11 then 10191103332
    when stamp = 12 then 10121487185
    when stamp = 13 then 9960983407
    when stamp = 14 then 9823388764
    when stamp = 15 then 5831256436
    else null
  end as owner_id,
  case 
    when stamp = 1 then 'Helloprint'
    when stamp = 2 then 'Talent Sourcing Partner'
    when stamp = 3 then 'TSH'
    when stamp = 4 then 'ClubCollect'
    when stamp = 5 then 'Freeday'
    when stamp = 6 then 'Ciphix'
    when stamp = 7 then 'Greenberry'
    when stamp = 8 then 'Solid Results'
    when stamp = 9 then 'DELTA'
    when stamp = 10 then 'VI Technologies'
    when stamp = 11 then 'Koole Terminals'
    when stamp = 12 then 'IWB'
    when stamp = 13 then 'PAY'
    when stamp = 14 then 'Equans'
    when stamp = 15 then 'HubSpot'
    else null
  end as owner_name
from stamped
order by store_id asc