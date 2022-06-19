{{ config(
  materialized = 'table',
) }}

WITH f_reviews AS (
    SELECT * FROM {{ ref('f_reviews') }}
),

full_moon_dates AS (
    SELECT * FROM {{ ref('seed_full_moon_dates') }}
)

SELECT r.*,
CASE
    WHEN fm.full_moon_date IS NULL THEN 'not full moon'
    ELSE 'full moon'
  END AS is_full_moon
FROM
  f_reviews r
  LEFT JOIN full_moon_dates fm
  --ON (TO_DATE(r.review_date) = DATEADD(DAY, 1, fm.full_moon_date)) -- 2018-02-10T00:00:00Z
  ON parse_Date('%Y-%m-%d', substr(r.review_date,1,10)) =  fm.full_moon_date -- 2018-02-10T00:00:00Z
  
  --ON r.review_date = fm.full_moon_date)
  
