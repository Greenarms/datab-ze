/*SELECT SUM(price) FROM products WHERE STATUS = 'IN';*/
/* select 1 sčitavam hodnotu všetkych zakupitelnych produktov */

/*SELECT id, merchant_id, `NAME`,created_at, description FROM products  ORDER BY created_at DESC; */
/* select 2 vyber podla dstumu vytvorenia od najnovsieho po najstarsie */


/*SELECT  product_id,order_id,quantity  FROM order_items ORDER BY quantity DESC LIMIT 8;*/
/*  select 3 order by select kde ich usporiada od najvacsej kvantity a limituje to na 8    */


SELECT COUNT (quantity) FROM order_items  



