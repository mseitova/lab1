-- 1. CREATE DATABASE
CREATE DATABASE lab1;

-- 2. CREATE TABLE
CREATE TABLE users (
    id SERIAL,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);

-- 3. Add integer column (0 or 1) «isadmin» to «users» table
ALTER TABLE users
ADD COLUMN isadmin INTEGER CHECK (isadmin IN (0, 1));

-- 4. Change type of «isadmin» column to boolean
ALTER TABLE users
DROP CONSTRAINT IF EXISTS users_isadmin_check;

ALTER TABLE users
ALTER COLUMN isadmin TYPE BOOLEAN
USING isadmin::boolean;

-- 5. Set default value as false to «isadmin» column
ALTER TABLE users
ALTER COLUMN isadmin SET DEFAULT FALSE;

-- 6. Add primary key constraint to id column
ALTER TABLE users
ADD PRIMARY KEY (id);

-- 7. Create table «tasks» with following fields
CREATE TABLE tasks (
    id SERIAL,
    name VARCHAR(50),
    user_id INT
);

-- 8. Delete «tasks» table
DROP TABLE tasks;

-- 9. Delete «lab1» database
\c postgres
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'lab1';

DROP DATABASE lab1;
