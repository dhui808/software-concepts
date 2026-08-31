```
CREATE TABLE user_password (
    user_name VARCHAR(255) NOT NULL,
    url VARCHAR(2048) NOT NULL,
    password VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL,
    updateDatetime DATETIME NOT NULL
);

-- 1. Insert a new password record
INSERT INTO user_password (user_name, url, password, status, updateDatetime)
VALUES ('john_doe', 'https://github.com', 'EncryptedHash123!', 'active', NOW());

-- 2. Update an existing password record
UPDATE user_password
SET password = 'NewSecureHash456!',
    updateDatetime = NOW()
WHERE user_name = 'john_doe' AND url = 'https://github.com';
```
