DROP DATABASE IF EXISTS "DbEventManagementPlatform";

CREATE DATABASE "DbEventManagementPlatform"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_Indonesia.1252'
    LC_CTYPE = 'English_Indonesia.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE "DbEventManagementPlatform"
    IS 'Database for Event Management Platform System';

CREATE TABLE users (
	id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	username VARCHAR(50) NOT NULL,
	password VARCHAR(255) NOT NULL
);

CREATE TABLE events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title VARCHAR(100) NOT NULL,
  description TEXT,
  date TIMESTAMP NOT NULL,
  created_by UUID REFERENCES users(id) ON DELETE CASCADE
);


INSERT INTO users (id, username, password)
VALUES
  (gen_random_uuid(), 'hatta', '4b3059d61a257b9abac12c3cd045aa1f55804130c11677b731c0e0cc38a45010'); 
  
INSERT INTO events (id, title, description, date, created_by)
VALUES
  (gen_random_uuid(), 'Sample Event', 'This is a sample event description.', NOW(), 
   (SELECT id FROM users WHERE username = 'hatta' LIMIT 1));