-- Phase 13: Traffic Quality Assurance (IVT & Bot Filtering Pipeline)
-- Group traffic logs by IP and browser string to flag suspicious activity patterns

SELECT 
    ip_address,
    user_agent,
    COUNT(click_id) AS total_clicks_generated,
    
    -- Conditional Rule Engine: Easily categorize good traffic vs fraud traffic
    CASE 
        WHEN user_agent LIKE '%Bot%' OR user_agent LIKE '%Crawl%' THEN 'GIVT (General Bot Traffic)'
        WHEN COUNT(click_id) > 100 THEN 'SIVT (Sophisticated Click Flood Traffic)'
        ELSE 'Valid Human Traffic'
    END AS traffic_classification

FROM Raw_Traffic_Logs
GROUP BY ip_address, user_agent
-- Simple Filter: Pull out only the rogue actors flooding the server
HAVING COUNT(click_id) > 50
ORDER BY total_clicks_generated DESC;
