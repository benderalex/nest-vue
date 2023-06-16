Quick start for a project using docker-compose + nestjs + react|vue + postgresql


<img src="https://nestjs.com/img/logo-small.svg" alt="Nest.js" width="200" />

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/320px-React-icon.svg.png" alt="React" width="200" />

<img src="https://vuejs.org/images/logo.png" alt="Vue.js" width="200" />

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Postgresql_elephant.svg/1200px-Postgresql_elephant.svg.png" alt="PostgreSQL" width="200" />


## Prerequisites
- Docker
- Docker Compose

## Usage

1. Clone the repository to your local machine:

   ```
   git clone https://github.com/bendera/nest-vue
   ```

2. Navigate to the repository directory:

   ```
   cd nest-vue
   ```

3. Make sure Docker and Docker Compose are installed:

   ```
   docker -v
   docker-compose -v
   ```

   If they are not installed, please refer to the Docker documentation to install them.

4. Make the script executable:

   ```
   chmod +x app.sh
   ```

5. Run the script with the desired command:

   ```
   ./app.sh [command]
   ```

   Replace `[command]` with one of the following options:

    - `init` - Initializes the project with the specified frontend framework (React or Vue.js). This command sets up the project directories, installs dependencies, and starts the application.
        - To initialize with React, use: `./app.sh init react`
        - To initialize with Vue.js, use: `./app.sh init`

    - `backend i [packages]` - Installs additional packages for the backend. Specify the packages as space-separated arguments after the command. For example:
      ```
      ./app.sh backend i package1 package2
      ```

    - `frontend i [packages]` - Installs additional packages for the frontend. Specify the packages as space-separated arguments after the command. For example:
      ```
      ./app.sh frontend i package1 package2
      ```

    - `backend` - Accesses the backend container's bash shell.

    - `frontend` - Accesses the frontend container's bash shell.

    - `stop` - Stops the Docker containers.

   If no command is provided, the script will default to starting the application using Docker Compose.

## Example Usage

- Initialize the project with React:

  ```
  ./app.sh init react
  ```

- Install additional backend packages:

  ```
  ./app.sh backend i package1 package2
  ```

- Access the frontend container's bash shell:

  ```
  ./app.sh frontend
  ```

- Stop the Docker containers:

  ```
  ./app.sh stop
  ```