WITH stg_listings AS (
  SELECT
* FROM
    {{ ref('stg_listings') }}
)
SELECT
  listing_id,
  listing_name,
  room_type,
  minimum_nights,
  --CASE
  --  WHEN minimum_nights is NULL THEN 1
  --  ELSE minimum_nights
  --END AS minimum_nights,
  host_id,
  -- REPLACE (price_str, "$", "")  AS price,
  -- case when substr(price_str,1,1)="$" then substr(price_str,2,len(price_str)) else price_str end as price,
  regexp_replace(price_str, '[^0-9]', '') as price,
  created_at,
  updated_at
FROM
  stg_listings
