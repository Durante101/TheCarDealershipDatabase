SELECT d.name, v.VIN, v.color, v.make, v.model
FROM inventory i
JOIN dealership d ON d.dealership_id = i.dealership_id
JOIN vehicles v ON v.VIN = i.VIN
WHERE d.name = "Z06 Performance Motors"