# Docker and Jenkins Todo Application

## Description

This project is a Todo application that leverages Docker and Jenkins for continuous integration and continuous deployment (CI/CD). The application allows users to manage their tasks efficiently and is built with scalability and reliability in mind.

### Key Features
- **Docker**: Containerizes the application for consistent environments across development, testing, and production.
- **Jenkins**: Automates the build, test, and deployment processes to ensure rapid and reliable delivery of updates.

### Prerequisites
- Docker installed on your machine
- Jenkins installed and configured

### Getting Started
1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/todo-app.git
    ```
2. Navigate to the project directory:
    ```sh
    cd TodoApp
    ```
3. Build and run the Docker containers:
    ```sh
    docker-compose up --build
    ```
4. Access the application at `http://localhost:3000`.

### CI/CD Pipeline
The Jenkins pipeline is configured to:
1. Pull the latest code from the repository.
2. Build the Docker images.
3. Run tests inside the Docker containers.
4. Deploy the application to the specified environment.

### Contributing
Contributions are welcome! Please fork the repository and submit a pull request.

### License
This project is licensed under the MIT License.
