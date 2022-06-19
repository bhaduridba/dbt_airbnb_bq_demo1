WITH raw_hosts AS 
( 
	SELECT
	*
	FROM
	-- `ingka-dsm-dataplatform-dev.airbnb_analytics.raw_hosts` 
	 {{ source('airbnb_analytics', 'hosts') }}
)

SELECT
id AS host_id,
NAME AS host_name, is_superhost, created_at, updated_at
FROM
    raw_hosts
