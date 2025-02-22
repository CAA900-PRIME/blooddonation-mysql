CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    dob DATE NOT NULL DEFAULT '1970-01-01',
    postalCode CHAR(7) NOT NULL DEFAULT 'A1A 1A1',
    createdDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    verifiedDate DATETIME NULL,
    lastLoggedIn DATETIME NULL
);

CREATE TABLE IF NOT EXISTS application (
    id INT AUTO_INCREMENT PRIMARY KEY,
    requester_id INT NOT NULL,
	doner_id INT NULL,
    applicant_name VARCHAR(100) NOT NULL,
    blood_type VARCHAR(3) NOT NULL,
    hospital_name VARCHAR(255) NOT NULL,
	hospital_address VARCHAR(255) NOT NULL,
	country VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
	contact_phone_number VARCHAR(15) NOT NULL,
    status ENUM('Pending', 'Approved', 'Rejected', 'Completed') DEFAULT 'Pending',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (requester_id) REFERENCES users(id),
    FOREIGN KEY (doner_id) REFERENCES users(id)
);


-- Updated application table (testing commit issue)

