CREATE OR REFRESH MATERIALIZED VIEW dbassociate.silver.s_review
AS
SELECT
    business_id,
    review_id,
    user_id,
    date,
    text,
    stars,
    CASE 
        WHEN stars == 1 then 'very negative'
        WHEN stars == 2 then 'negative'
        WHEN stars == 3 then 'neutral'
        WHEN stars == 4 then 'positive'
        WHEN stars == 5 then 'very positive'
    END AS review_sentiment
FROM dbassociate.bronze.b_review