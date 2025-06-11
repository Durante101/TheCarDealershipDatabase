SELECT d.name AS dealership_name, v.VIN, v.make, v.model, v.year, s.buyer_name, s.sale_price, s.sale_date
FROM sales_contracts s
JOIN vehicles v ON s.VIN = v.VIN
JOIN inventory i ON v.VIN = i.VIN
JOIN dealership d ON i.dealership_id = d.dealership_id
WHERE d.name = 'Z06 Performance Motors'
AND s.sale_date BETWEEN '2025-01-01' AND '2025-12-31';