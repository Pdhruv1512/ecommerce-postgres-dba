-- Add 1 million test rows to order_items so index performance can be measured.
INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
SELECT
    4183 + g,                              -- new IDs continue after the real ones
    1 + floor(random() * 1682)::int,       -- a random existing order (1 to 1682)
    1 + floor(random() * 64)::int,         -- a random existing product (1 to 64)
    1 + floor(random() * 5)::int           -- a quantity from 1 to 5
FROM generate_series(1, 1000000) AS g
ON CONFLICT (order_item_id) DO NOTHING;   -- safe to re-run: skips rows that already exist

-- Update the statistics Postgres uses to plan queries
ANALYZE order_items;