# Database Setup Instructions

This document outlines the steps followed to create and test the `users` table in the `blooddonation` database from scratch.

---

Install Docker in windows :

Clone the Repository:
Open your terminal and Cloned the repository:

git clone git@github.com:CAA900-PRIME/blooddonation-mysql.git
cd blooddonation-mysql

Build the MySQL Docker Image:
Run the following commands to build and start the MySQL container:
docker build -t blooddonation-mysql .
docker run --name blooddonation_db --network host -v mysql_data:/var/lib/mysql -d blooddonation-mysql


Access the MySQL Container:
Log into the MySQL container to run commands:

docker exec -it blooddonation_db bash
mysql -u flask_user -p
(Default password: flask_password)

3. Update the Database Schema
need to update the init.sql file to define the users table with the required fields.

Open the init.sql file located in the repository.
Add the users table:

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    createdDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    verifiedDate DATETIME NULL,
    lastLoggedIn DATETIME NULL
);

Manually Alter the Table
Since the database already exists, I manually updated the table to match the desired schema.

Inside the MySQL prompt (mysql>), run the following SQL commands to add the missing columns:

ALTER TABLE users
    ADD phone_number VARCHAR(15) NOT NULL,
    ADD createdDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    ADD verifiedDate DATETIME NULL,
    ADD lastLoggedIn DATETIME NULL;
Verify the updated table structure:


DESCRIBE users;

This will add the missing columns directly to the existing users table.

Test the Table:

insert a sample row to ensure everything works correctly:

INSERT INTO users (email, username, password, phone_number)
VALUES ('test@example.com', 'testuser', 'securepassword', '1234567890');

Verify the data:

SELECT * FROM users;

***Updated the users table to include new fields:***

ALTER TABLE users
ADD firstName VARCHAR(50) NOT NULL DEFAULT '',
ADD lastName VARCHAR(50) NOT NULL DEFAULT '',
ADD dob DATE NOT NULL DEFAULT '1970-01-01',
ADD postalCode CHAR(7) NOT NULL DEFAULT 'A1A 1A1';

Verified the updated table structure:

DESCRIBE users;

Inserted sample data for testing:

INSERT INTO users (email, username, password, phone_number, firstName, lastName, dob, postalCode)
VALUES ('john.doe@example.com', 'johndoe', 'securepassword123', '9876543210', 'John', 'Doe', '1990-01-01', 'K1A 0B1');

INSERT INTO users (email, username, password, phone_number, firstName, lastName, dob, postalCode)
VALUES ('jane.doe@example.com', 'janedoe', 'password123', '8765432109', 'Jane', 'Doe', '1995-05-15', 'H0H 0H0');

Verified the inserted data:

SELECT * FROM users;

Updating init.sql
Modified the init.sql file to include the updated schema:

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
Saved the file.


4. Test the Schema
After modifying the init.sql file, rebuild the Docker container to ensure the changes are applied.

Stop the running container:

docker stop blooddonation_db
docker rm blooddonation_db

Rebuild and restart the container:

docker build -t blooddonation-mysql .
docker run --name blooddonation_db --network host -v mysql_data:/var/lib/mysql -d blooddonation-mysql

Verify the table structure:

Log into MySQL as shown in Step 2.
Run:

SHOW DATABASES;
USE blooddonation;
SHOW TABLES;
DESCRIBE users;


5. Commit and Push Your Changes
Create a New Branch in Git
Navigate to the blooddonation-mysql directory:

cd path/to/blooddonation-mysql

Create a new branch for your changes:

git checkout -b database-setup

 Commit Your Changes

Stage the init.sql file:

git add init.sql

Commit the changes with a meaningful message:

git commit -m "Added users table schema to init.sql"

 Push the Branch to GitHub
Push your branch to the repository:

git push origin database-setup
