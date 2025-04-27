
CREATE TABLE alerts (
    id SERIAL PRIMARY KEY,
    alert_type VARCHAR(50) NOT NULL,
    temp DECIMAL(5,2),
    precipitation DECIMAL(5,2),
    description TEXT
);

CREATE TABLE login (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE weather_based_alert (
    id SERIAL PRIMARY KEY,
    temp DECIMAL(5,2),
    humidity DECIMAL(5,2),
    season VARCHAR(50),
    clothing_recommendation TEXT
);

CREATE TABLE feedback (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE clothes (
    id SERIAL PRIMARY KEY,
    temp_range VARCHAR(20) NOT NULL,
    weather_condition VARCHAR(50) NOT NULL,
    outfit_recommendation VARCHAR(150) NOT NULL
);

INSERT INTO clothes (temp_range, weather_condition, outfit_recommendation) VALUES
-- Freezing conditions
('Below 0°C', 'Freezing', 'Heavy Coat, Woolen Cap, Thermal Wear, Gloves, Snow Boots'),
('Below 0°C', 'Snowy', 'Insulated Jacket, Snow Pants, Boots, Beanie, Scarf'),

-- Cold weather
('1-10°C', 'Cold & Dry', 'Thick Jacket, Sweater, Scarf, Gloves, Boots'),
('1-10°C', 'Cold & Windy', 'Windproof Jacket, Sweater, Beanie, Gloves'),
('1-10°C', 'Cold & Rainy', 'Waterproof Jacket, Sweater, Warm Shoes'),

-- Cool weather
('11-15°C', 'Cool & Cloudy', 'Light Jacket, Full Sleeves, Jeans, Sneakers'),
('11-15°C', 'Cool & Windy', 'Windbreaker, Long Pants, Sneakers'),
('11-15°C', 'Cool & Rainy', 'Raincoat, Umbrella, Waterproof Shoes'),

-- Mild weather
('16-20°C', 'Mild & Sunny', 'Light Jacket, T-Shirt, Jeans, Sneakers'),
('16-20°C', 'Mild & Windy', 'Windbreaker, Comfortable Shoes'),
('16-20°C', 'Mild & Rainy', 'Light Raincoat, Waterproof Footwear'),

-- Warm weather
('21-25°C', 'Warm & Sunny', 'T-Shirt, Jeans, Sneakers, Sunglasses'),
('21-25°C', 'Warm & Windy', 'Breathable Clothing, Sneakers'),
('21-25°C', 'Warm & Rainy', 'Light Raincoat, Waterproof Shoes'),

-- Hot weather
('26-30°C', 'Hot & Dry', 'Cotton T-Shirt, Shorts, Sandals, Sunglasses'),
('26-30°C', 'Hot & Humid', 'Breathable Clothes, Hat, Comfortable Shoes'),
('26-30°C', 'Hot & Rainy', 'Loose Cotton Clothes, Waterproof Sandals, Umbrella'),

-- Very hot weather
('31-35°C', 'Very Hot & Dry', 'Loose Cotton Clothes, Hat, Sunglasses, Sunscreen'),
('31-35°C', 'Very Hot & Humid', 'Light Clothes, Cap, Hydration is Key!'),
('31-35°C', 'Very Hot & Rainy', 'Loose Cotton Clothes, Waterproof Sandals'),

-- Extreme heat
('36-45°C', 'Extreme Heat & Dry', 'Loose Cotton Clothes, Hat, Sunglasses, Hydrate!'),
('36-45°C', 'Extreme Heat & Humid', 'Linen Clothing, Stay in Shade, Hydrate!'),
('Above 45°C', 'Extreme Heat', 'Loose Cotton Clothes, Hat, Sunscreen, Stay Indoors'),

-- Foggy conditions
('1-10°C', 'Foggy', 'Layered Clothing, Reflective Jacket, Scarf'),
('11-20°C', 'Foggy', 'Full Sleeves, Light Jacket, Visibility Gear'),

-- Special conditions
('Any', 'Stormy', 'Waterproof Jacket, Sturdy Boots, Emergency Gear'),
('Any', 'Heavy Rain', 'Raincoat, Waterproof Shoes, Umbrella'),
('Any', 'Thunderstorm', 'Stay Indoors, Avoid Metal Objects');


