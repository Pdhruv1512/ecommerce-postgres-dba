-- Index foreign key columns. Postgres does not index foreign keys automatically,
-- and these columns are used in joins and lookups.
CREATE INDEX IF NOT EXISTS idx_order_items_order_id   ON order_items(order_id);
CREATE INDEX IF NOT EXISTS idx_order_items_product_id ON order_items(product_id);
CREATE INDEX IF NOT EXISTS idx_orders_customer_id     ON orders(customer_id);

-- Refresh statistics so the planner knows about the new indexes
ANALYZE;