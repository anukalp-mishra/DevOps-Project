pringBoot_Book_Store
Book Store Management | Spring boot simple project | MySql | Thymeleaf |JPA
Project-Documentation
Project logo

SpringBoot Book Store Management
Status GitHub Issues GitHub Pull Requests License

The Book Store Management system is a Java-based software application developed using Springboot, Thymeleaf, and JPA frameworks. The system is designed to simplify the operations of a bookstore by providing tools for managing inventory, tracking sales, and monitoring store performance. It is a scalable and flexible solution that provides a user-friendly interface for easy navigation and performing tasks such as adding new books, updating inventory, and managing sales.


🧐 About
The Book Store Management System is a Java-based web application developed using Spring Boot, Thymeleaf, and JPA. The purpose of this system is to manage the storage, tracking, and sale of books in a bookstore. It has been designed for single-user access, with the admin managing the overall application. The system is built using the MVC (Model, View, Controller) pattern, with Spring Boot as the backend, Hibernate as the data access layer, and HTML, CSS, and Bootstrap for the frontend. MySQL is used as the database for this application.

The Book Store Management system is a powerful software solution designed to simplify the operations of a bookstore. Developed using Java and leveraging the Springboot, Thymeleaf, and JPA frameworks, the system offers a variety of features to help bookstore owners or managers manage their store operations more efficiently.


Browse and install docker & docker compose with below linked
	
https://github.com/anukalp-mishra/DevOps-Project.git
			
	 1. Install Docker on Ec2 instance ubuntu
	 
		sudo apt-get update -y
		sudo apt-get install docker.io -y
		
		sudo usermod -aG docker ubuntu		
		newgrp docker		
		sudo chmod 777 /var/run/docker.sock

		docker --version
		Docker version 27.5.1, build 27.5.1-0ubuntu3~24.04.2
	 
	2.Install Docker compose
		 
		 #!/bin/bash

			sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
			sudo chmod +x /usr/local/bin/docker-compose
			docker-compose --version
			
		Check the docker compose version with below command
			docker-compose --version
		
	3.  Clone Java project code from Github to Ec2
		
			git clone https://github.com/anukalp-mishra/DevOps-Project.git
            
            **Tip:** If your project folder is named differently, adjust the path accordingly.  
            For example, if your cloned repo is in `/workspaces/DevOps-Project/SpringBoot-2T-App`, use:
            ```bash
            cd /workspaces/DevOps-Project/SpringBoot-2T-App
            ```
            Replace with your actual project directory if needed.
			
	4.  Install Mevan and Java JDK on VM as its java project
	    
			apt install maven
			
		Print java and mvn version on succesfull installation
		
			java --version
			mvn --version
			
	5. Build the app using maven with 
	        mvn clean package
		**** target folder will be created with .jar file
		
	6. Create Docker file from stractch 
	
	    nano Dockerfile 
		    FROM adoptopenjdk/openjdk11  
			EXPOSE 8080
			COPY target/spring-boot-mysql.jar spring-boot-mysql.jar
			ENTRYPOINT ["java","-jar","/spring-boot-mysql.jar"]
			

	     explaination
		 
			1. Base Image
			dockerfile
			
			FROM adoptopenjdk/openjdk11
			This tells Docker to start from the OpenJDK 11 image.

			It already contains Java 11 installed, so you don’t need to manually install Java in your container.

			Perfect for running Java-based apps like Spring Boot.

			2. Port Exposure
			dockerfile
			
			EXPOSE 8080
			This documents that the container listens on port 8080.

			It doesn’t actually open the port on the host — it’s more of a guide for others (and tools like Kubernetes or Docker run commands) to know which port to map.

			3. Copying the Jar File
			dockerfile
			
			COPY target/spring-boot-mysql.jar spring-boot-mysql.jar
			Takes the JAR file you’ve built locally (target/spring-boot-mysql.jar) and copies it into the container’s root directory (/spring-boot-mysql.jar by default).

			This is usually done after building the app with Maven or Gradle.

			4. Entry Point
			dockerfile
			
			ENTRYPOINT ["java","-jar","/spring-boot-mysql.jar"]
			This is the command that runs when the container starts.

			Here, it runs:

			
			java -jar /spring-boot-mysql.jar
			This launches your Spring Boot application inside the container.

			
	7. Create Docker images of Spring Boot Application	
				
		    docker build -t spring-boot-mysql-app .
		
	8. Docker Compose file . Create a docker-compose.yml file 			
		
			nano 	docker-compose.yml

			version: "3"

			services:
			  application:
				image: spring-boot-mysql-app
				ports:
				  - "8080:8080"
				networks:
				  - springboot-db-net
				depends_on:
				  - mysqldb
				volumes:
				  - /data/springboot-app

			  mysqldb:
				image: mysql:5.7
				networks:
				  - springboot-db-net
				environment:
				  - MYSQL_ROOT_PASSWORD=root
				  - MYSQL_DATABASE=sbms
				volumes:
				- /data/mysql

			networks:
			  springboot-db-net:
					
					docker compose up -d
					
					target/spring-boot-mysql.jar
					
	9. Deploy application using the below command with containers
	    Start containers in detached mode
		Use: Starts all services defined in the docker-compose.yml file in the background (detached mode).
	     
			docker-compose up -d
		Stop and remove containers
		
		Use: Stops all running containers from the docker-compose.yml setup and removes them along with their networks (but not volumes unless specified).
         
			docker-compose down
			
			
	10. Access the running MySQL container
			docker exec -it 3fec1c397949 /bin/bash
			Use: Opens an interactive bash shell inside the running container with ID 3fec1c397949.
		
	11. Login to MySQL inside the container
	    Use: Connects to the MySQL server running inside the container using root as username and root as password.
		
			mysql -h localhost -u root -proot
			
	12. List all databases	
		show databases ;
		
		Use: Displays all available databases in the MySQL server.
	
	13. Select a database
	    Use: Switches to the sbms database to run queries on it.
			mysql> mysql -h localhost-u root -proot
			
			
			mysql> show databases ;
			+--------------------+
			| Database           |
			+--------------------+
			| information_schema |
			| mysql              |
			| performance_schema |
			| sbms               |
			| sys                |
			+--------------------+
			5 rows in set (0.00 sec)
			
	
	14. Select a database
			use sbms ;
		
	15. List tables in the selected database	
			show tables ;
		
		Use: Retrieves all rows and columns from the book table for review.
		
	16. Fetch all records from a table	
		select * from book
		
				mysql> select * from book ;
				+---------+-------------+-----------+------------+
				| book_id | author_name | book_name | book_price |
				+---------+-------------+-----------+------------+
				|       1 | anukalp     | anubook   |        200 |
				+---------+-------------+-----------+------------+
				1 row in set (0.00 sec)
				
				
	17. Exit the database and container 
	     exit
		 
		 
    Delete the resources created