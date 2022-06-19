WITH raw_reviews AS 
( 
	SELECT
	*
	FROM
	-- `ingka-dsm-dataplatform-dev.airbnb_analytics.raw_reviews` 
	{{ source('airbnb_analytics', 'reviews') }}
)

SELECT
 listing_id, date AS review_date, reviewer_name,
comments AS review_text, sentiment AS review_sentiment
FROM
    raw_reviews
