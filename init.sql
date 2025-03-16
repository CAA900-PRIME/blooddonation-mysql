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
    otp_secret VARCHAR(16) NULL  -- Added 2FA column
);

CREATE TABLE IF NOT EXISTS application (
    id INT AUTO_INCREMENT PRIMARY KEY,
    requester_id INT NOT NULL,
	donor_id INT NULL,
    blood_type VARCHAR(3) NOT NULL,
    hospital_name VARCHAR(255) NOT NULL,
	hospital_address VARCHAR(255) NOT NULL,
	country VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
	contact_phone_number VARCHAR(15) NOT NULL,
	appointment DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Pending',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (requester_id) REFERENCES users(id),
    FOREIGN KEY (donor_id) REFERENCES users(id)
);
