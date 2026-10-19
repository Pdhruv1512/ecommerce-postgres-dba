-- Roles and permissions: least-privilege access for different users.

-- 1. Create group roles (permission sets, no login)
CREATE ROLE analyst_role;
CREATE ROLE app_role;

-- 2. Analyst: read-only access to all tables
GRANT CONNECT ON DATABASE ecommerce TO analyst_role;
GRANT USAGE ON SCHEMA public TO analyst_role;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO analyst_role;

-- 3. App: read everything, add/update orders, never delete
GRANT CONNECT ON DATABASE ecommerce TO app_role;
GRANT USAGE ON SCHEMA public TO app_role;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO app_role;
GRANT INSERT, UPDATE ON orders, order_items TO app_role;

-- 4. Create login users and add them to the roles
-- NOTE: placeholder passwords for a local demo. Never commit real passwords to GitHub.
CREATE ROLE analyst_user LOGIN PASSWORD 'change_me' IN ROLE analyst_role;
CREATE ROLE app_user     LOGIN PASSWORD 'change_me' IN ROLE app_role;