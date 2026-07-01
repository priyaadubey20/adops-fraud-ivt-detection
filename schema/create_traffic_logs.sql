-- Database Architecture: Raw Impression and Traffic Event Logging
-- Captures incoming user connection attributes for security auditing

CREATE TABLE Raw_Traffic_Logs (
    click_id VARCHAR(50) PRIMARY KEY,
    ip_address VARCHAR(45) NOT NULL,
    user_agent VARCHAR(255) NOT NULL, 
    publisher_id VARCHAR(50) NOT NULL
);
