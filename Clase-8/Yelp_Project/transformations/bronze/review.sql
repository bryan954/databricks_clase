CREATE OR REFRESH MATERIALIZED VIEW dbassociate.bronze.b_review
AS
SELECT 
*
FROM read_files(
    "/Volumes/dbassociate/default/vol_landing/session08/yelp_academic_dataset_review.json",
     format => "json"
)