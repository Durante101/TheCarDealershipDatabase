SELECT d.dealership_id, d.name, d.address, d.phone, d.email
FROM inventory i
JOIN dealership d ON d.dealership_id = i.dealership_id
JOIN vehicles v ON v.VIN = i.VIN
WHERE v.VIN = "1G1YU2D68P5123456"