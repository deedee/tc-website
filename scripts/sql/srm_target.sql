SELECT coder_id as user_id, CURRENT as earned_date
FROM algo_rating_history 
WHERE algo_rating_type_id=1
GROUP BY coder_id
HAVING MAX(rating) >= 3000
