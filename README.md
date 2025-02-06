### Project Overview - Blood Donation Database
This web application is designed to simplify blood donation by directly connecting donors and requester without intermediaries. All users register under a single system, where they can act as both donors and requesters. Once registered, users needing blood can submit a request, while donors simply wait to receive notifications about nearby requests. The goal is to make the donation process faster and more efficient, reducing the time involved in finding a suitable donor. The platform prioritizes simplicity, ensuring a user-friendly experience with minimal steps.

#### Prerequisites
Ensure Docker installed, please follow the instructions from here: [docker installation](https://docs.docker.com/engine/install/) For [MacOS](https://docs.docker.com/desktop/setup/install/mac-install/)

### Database
This is the database used for the web application which must be running first and ensure that all tables are created successfully before running the web application.

Ensure a custom network container, where all the containers such as MySQL and flask application can communicate with each other.

```bash
docker network create blooddonation-network
```
##### The following command will build mysql image.
```bash
docker build -t blooddonation-mysql .
```
##### Next will run the image in a container.
```bash
docker run --name blooddonation_db --network blooddonation-network -v mysql_data:/var/lib/mysql -d blooddonation-mysql
```

Custom Run Optional: provide your own environment variables

```bash
docker run --name mysql_db \
  -v mysql_data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=root_password \
  -e MYSQL_DATABASE=blooddonation \
  -e MYSQL_USER=flask_user \
  -e MYSQL_PASSWORD=flask_password \
  --network blooddonation-network \
  -d blooddonation-mysql
```

>[!NOTE]
>To ensure data persistence, the database will store all data on the host machine, even if the container is stopped or removed.