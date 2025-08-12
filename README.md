# Moftaked Docker Environment

This repository contains Docker configuration for the entire Moftaked application stack, including database, backend services, and frontend applications.

## Project Structure

```
.
├── .env.example           # Example environment variables
├── .gitignore             # Git ignore file
├── docker-compose.yml     # Docker Compose configuration
├── mysql/                 # MySQL database configuration
│   └── init/              # Database initialization scripts
│       ├── 01-moftaked.sql      # Database schema
│       └── 03-migration.sql     # Database migration
└── README.md              # This documentation
```

## Setup Instructions

### Prerequisites

- Docker and Docker Compose installed on your system
- Git (to clone this repository)

### Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/moftaked/moftaked-infra.git
   cd moftaked-infra
   ```

2. Create your environment file:
   ```bash
   cp .env.example .env
   ```

3. Edit the `.env` file with your configuration:
   ```
   MYSQL_ROOT_PASSWORD=your_root_password
   MYSQL_DATABASE=moftaked
   MYSQL_USER=your_db_user
   MYSQL_PASSWORD=your_db_password
   ```

4. Start the application stack:
   ```bash
   docker-compose up -d
   ```

## Components

### Database (MySQL)

The MySQL database is configured with:
- Version 8.4
- Automatic initialization scripts in `mysql/init`
- Data persistence using Docker volumes
- Health checks for reliability

Database port: 3306 (mapped to host, it will result an error if there is a mysql instance running on the host machine)

### Backend Services

*Coming soon - Backend services will be added to the `docker-compose.yml` file*

### Frontend Application

*Coming soon - Frontend application will be added to the `docker-compose.yml` file*

## Development Workflow

### Accessing the Database

Connect to MySQL with:
- Host: localhost
- Port: 3306
- Database: As configured in .env
- Username: As configured in .env
- Password: As configured in .env

### Logs

View container logs:
```bash
docker-compose logs -f [service-name]
```

### Rebuilding Services

After making changes to the code or configuration:
```bash
docker-compose build [service-name]
docker-compose up -d [service-name]
```

## Database Schema

The database includes tables for:
- User accounts and authentication
- Schools and classes
- Person records with contact information
- Events and attendance tracking
- Role-based access control

The 03-migration.sql script implements a district data normalization that moves district information from the persons table to a dedicated districts table.

## Production Deployment

For production deployment:
1. Use secure passwords in the .env file
2. Consider setting up a reverse proxy (Nginx/Traefik) for SSL termination
3. Implement regular database backups
4. Configure proper resource limits for containers

## License

*Add license information here*
