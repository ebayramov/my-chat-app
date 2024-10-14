# Real-Time Chat Application

## Video Tutorial  
For a visual guide on how to use this Chat Application, watch the video demonstration below:  
[![Watch the video](https://img.youtube.com/vi/1EWiokzSDNE/maxresdefault.jpg)](https://youtu.be/1EWiokzSDNE)

## Project Overview  
This project is a real-time Chat Application developed using **Next.js**, **Socket.io**, **PHP**, and **MySQL**, all hosted via **Docker Compose**. The application allows users to create profiles, participate in public or private chat rooms, send text and image messages, and manage chat room settings, such as passwords, through a user-friendly interface. Messages in the chat rooms are grouped by date, and room invitations can be sent to other users.

## Features  
- **User Profiles**:
  - Create, log in, and log out of user accounts
- **Chat Rooms**:
  - Create public or private chat rooms
  - Join public rooms without a password
  - Join private rooms by entering the room password
  - Send invitations to other users to join rooms
  - Change room passwords using PIN verification
  - Exit from chat rooms
- **Messages**:
  - Send and delete text and image messages in real-time
  - Messages are grouped by date for easy navigation
- **Real-Time Communication**:
  - Built with Socket.io for live chat and real-time message updates

## Installation

### Prerequisites  
- **Docker** must be installed on your local machine.  
  - [Download Docker](https://www.docker.com/products/docker-desktop)

### Steps to Run the Project

1. **Clone the Repository**:  
   Clone this repository to your local machine:  
   ```bash
   git clone https://github.com/yourusername/your-chat-app.git
   ```

2. **Start Docker Containers**:  
   Navigate to the project directory and use Docker Compose to start the services:
   ```bash
   cd your-chat-app
   sudo docker-compose up --build -d
   ```

3. **Access the Application**:  
   Once the containers are up and running, you can access the services via the following URLs:
   - Next.js Frontend: http://localhost:3000/
   - PHP API: http://localhost:8080/
   - phpMyAdmin: http://localhost:8081/ (for managing the database)

4. **Database Setup**:  
   If you need to upload your own database, you can use phpMyAdmin by going to http://localhost:8081/.
   - Log in with the database credentials found in your docker-compose.yml file.
   - Import your SQL file to set up the required database.

## Usage
1. **Creating a Profile**:  
   Visit http://localhost:3000/ to create your user profile.

2. **Joining and Creating Rooms**:  
   - You can either join a public room or create a private one with a password.
   - For private rooms, a password is required to enter, while public rooms are open for all users.
   - Send invitations to other users to join your chat room.

3. **Sending Messages**:  
   - You can send both text and image messages to participants within the chat room.
   - Messages are updated in real-time across all users' screens.
   - Messages are grouped by date for better organization.

4. **Managing Chat Rooms**:  
   - You can change the password for private rooms using a PIN for verification.
   - Room owners can send invitations, and other users can join by accepting invitations.
   - When you're done, you can exit the room at any time.

## Tech Stack
- **Frontend**: Next.js
- **Real-Time Communication**: Socket.io
- **Backend**: PHP
- **Database**: MySQL
- **Containerization**: Docker Compose
