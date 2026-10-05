CREATE OR REFRESH MATERIALIZED VIEW dbassociate.silver.s_business
AS
SELECT 
    business_id,
    name,
    address,
    city,
    hours,
    attributes.wifi as wifi,
    attributes.NoiseLevel as noiselevel,
    CASE 
        WHEN attributes.DogsAllowed IS NULL THEN 'False'
        ELSE attributes.DogsAllowed
    END AS dogsallowed,
    attributes.Open24Hours as open24hours,
    is_open,
    review_count,
    stars
from dbassociate.bronze.b_business

