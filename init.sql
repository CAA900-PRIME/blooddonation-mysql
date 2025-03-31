CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    dob DATE NOT NULL DEFAULT '1970-01-01',
    home_address VARCHAR(255) NOT NULL,
    country VARCHAR(20) NOT NULL,
    city VARCHAR(20) NOT NULL,
    postalCode CHAR(7) NOT NULL DEFAULT 'A1A 1A1',
    createdDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    verifiedDate DATETIME NULL,
    lastLoggedIn DATETIME NULL,
    otp_secret VARCHAR(16) NULL,
    blood_type VARCHAR(3) NOT NULL,
    sex VARCHAR(15) NOT NULL,
    reset_token VARCHAR(100) NULL,
    reset_token_expiry DATETIME NULL,
	profile_pic LONGBLOB NULL
);


CREATE TABLE IF NOT EXISTS application (
    id INT AUTO_INCREMENT PRIMARY KEY,
    requester_id INT NOT NULL,
	donor_id INT NULL,
    hospital_name VARCHAR(255) NOT NULL,
	hospital_address VARCHAR(255) NOT NULL,
	country VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
	phone_number VARCHAR(15) NOT NULL,
	appointment DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Pending',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (requester_id) REFERENCES users(id),
    FOREIGN KEY (donor_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS activity_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    action_type VARCHAR(100) NOT NULL,
    action_description TEXT NOT NULL,
    ip_address VARCHAR(45) NULL,
    user_agent TEXT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS countries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(3) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS cities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES countries(id)
);

INSERT INTO countries (name, code) VALUES ('Canada', 'CA');
INSERT INTO countries (name, code) VALUES ('United States', 'US');

-- cities for Canada
INSERT INTO cities (name, country_id) VALUES ('Toronto', (SELECT id FROM countries WHERE code = 'CA'));
INSERT INTO cities (name, country_id) VALUES ('Vancouver', (SELECT id FROM countries WHERE code = 'CA'));
INSERT INTO cities (name, country_id) VALUES ('Montreal', (SELECT id FROM countries WHERE code = 'CA'));
INSERT INTO cities (name, country_id) VALUES ('Calgary', (SELECT id FROM countries WHERE code = 'CA'));
INSERT INTO cities (name, country_id) VALUES ('Edmonton', (SELECT id FROM countries WHERE code = 'CA'));
INSERT INTO cities (name, country_id) VALUES ('Ottawa', (SELECT id FROM countries WHERE code = 'CA'));
INSERT INTO cities (name, country_id) VALUES ('Winnipeg', (SELECT id FROM countries WHERE code = 'CA'));
INSERT INTO cities (name, country_id) VALUES ('Quebec City', (SELECT id FROM countries WHERE code = 'CA'));
INSERT INTO cities (name, country_id) VALUES ('Halifax', (SELECT id FROM countries WHERE code = 'CA'));
INSERT INTO cities (name, country_id) VALUES ('Saskatoon', (SELECT id FROM countries WHERE code = 'CA'));

-- cities for United States
INSERT INTO cities (name, country_id) VALUES ('New York', (SELECT id FROM countries WHERE code = 'US'));
INSERT INTO cities (name, country_id) VALUES ('Los Angeles', (SELECT id FROM countries WHERE code = 'US'));
INSERT INTO cities (name, country_id) VALUES ('Chicago', (SELECT id FROM countries WHERE code = 'US'));
INSERT INTO cities (name, country_id) VALUES ('Houston', (SELECT id FROM countries WHERE code = 'US'));
INSERT INTO cities (name, country_id) VALUES ('Phoenix', (SELECT id FROM countries WHERE code = 'US'));
INSERT INTO cities (name, country_id) VALUES ('Philadelphia', (SELECT id FROM countries WHERE code = 'US'));
INSERT INTO cities (name, country_id) VALUES ('San Antonio', (SELECT id FROM countries WHERE code = 'US'));
INSERT INTO cities (name, country_id) VALUES ('San Diego', (SELECT id FROM countries WHERE code = 'US'));
INSERT INTO cities (name, country_id) VALUES ('Dallas', (SELECT id FROM countries WHERE code = 'US'));
INSERT INTO cities (name, country_id) VALUES ('San Jose', (SELECT id FROM countries WHERE code = 'US'));
