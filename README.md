### Project Overview - Blood Donation Database

This web application is designed to simplify blood donation by directly connecting donors and requester without intermediaries. All users register under a single system, where they can act as both donors and requesters. Once registered, users needing blood can submit a request, while donors simply wait to receive notifications about nearby requests. 

The goal is to make the donation process faster and more efficient, reducing the time involved in finding a suitable donor. The platform prioritizes simplicity, ensuring a user-friendly experience with minimal steps.
#### Prerequisites
Ensure Docker installed, please follow the instructions from here: [Windows](https://docs.docker.com/desktop/setup/install/windows-install/) For [MacOS](https://docs.docker.com/desktop/setup/install/mac-install/)
### Database
This is the database used for the web application which must be running first and ensure that all tables are created successfully before running the web application.

#### Diagram
Here is our current design ER-Diagram.

![](Diagram/diagram.png)

##### The following command will build mysql image.
```bash
docker build -t blooddonation-mysql .
```
##### Next will run the image in a container.
```bash
docker run --name blooddonation_db --network host -v mysql_data:/var/lib/mysql -d blooddonation-mysql
```

>**Optional**: provide your own environment variables
```bash
docker run --name mysql_db \
  -v mysql_data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=root_password \
  -e MYSQL_DATABASE=blooddonation \
  -e MYSQL_USER=flask_user \
  -e MYSQL_PASSWORD=flask_password \
  --network host \
  -d blooddonation-mysql
```

>[!NOTE]
>To ensure data persistence, the database will store all data on the host machine, even if the container is stopped or removed.

### To access mysql container
To access the container must run the following command

```bash
docker exec -it blooddonation_db bash
```

Next will run mysql

```bash
mysql -u flask_user -p
```

Next it will prompt you asking for the password, the default password for the database for now will be `flask_password` will be changed later in production.

### Mysql queries

Here are list of commands you need to know when using mysql

1. `show databases;` this will show all the current databases.
2. `use blooddonation;` this will select a specific database called (blooddonation).
3. `show tables;` this will show all the current tables in that selected database.
4. `select * from users;` this should show a list for rows of user data if there is any.
5. To exit the mysql and the container, `CTRL+D`
