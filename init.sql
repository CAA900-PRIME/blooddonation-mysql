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
    user_id INT NOT NULL,
    applicant_name VARCHAR(100) NOT NULL,
    blood_type VARCHAR(3) NOT NULL,
    application_type ENUM('Request', 'Donation') NOT NULL,
    hospital_name VARCHAR(255) NULL,
    location VARCHAR(255) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    status ENUM('Pending', 'Approved', 'Rejected', 'Completed') DEFAULT 'Pending',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
