-- This transaction creates a product table, adds entries,
-- and selects those entries before rolling everything back
BEGIN;
CREATE TABLE IF NOT EXISTS product (
  id              SERIAL,
  name            VARCHAR(100) NOT NULL,
  sku             CHAR(8)
);
INSERT INTO product VALUES(DEFAULT, 'Apple, Fuji', '4131');
INSERT INTO product VALUES(DEFAULT, 'Banana', '4011');
SELECT * FROM product;
ROLLBACK;
