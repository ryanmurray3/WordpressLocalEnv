Create a new .env file for each project.

## **Structure and Purpose of `.env.dev` vs `.env.prod`**
### **1. `.env.dev` (Development):**  
- Used during local development and testing.  
- Contains credentials, URLs, and configurations for the **local Docker environment**.  
- It can have relaxed security settings (like weaker passwords or debug mode).  

### **2. `.env.prod` (Production):**  
- Used when deploying to the live environment.  
- Contains **real credentials** and secure settings.  
- More restrictive in terms of access and logging to improve security.  

---

## **Example Structure**
Here’s an example of what they should look like:

### ** `.env.dev`** (Development Example)
```ini
# Container and host settings
CONTAINER_NAME=project-dev
HOSTNAME=dev.project.local

# Database settings
DATABASE_NAME=project_dev
DATABASE_USER=dev_user
DATABASE_PASSWORD=dev_password
DATABASE_ROOT_PASSWORD=dev_root_password

# Debug settings
DEBUG=true
```

---

### ** `.env.prod`** (Production Example)
```ini
# Container and host settings
CONTAINER_NAME=project-prod
HOSTNAME=project.com

# Database settings
DATABASE_NAME=project_prod
DATABASE_USER=prod_user
DATABASE_PASSWORD=prod_password
DATABASE_ROOT_PASSWORD=prod_root_password

# Debug settings
DEBUG=false
```

---

## **Best Practices for Switching Between Them**
1. **Set Environment Variables When Running Docker:**  
   When working locally, you’d run:
   ```bash
   docker-compose --env-file .env.dev up -d --build
   ```

   For production, you’d run:
   ```bash
   docker-compose --env-file .env.prod up -d --build
   ```

2. **Keep Secrets Out of Source Control:**  
   - Add `.env*` to `.gitignore` to prevent accidental exposure:
     ```
     .env*
     ```

3. **Use Build-Time Variables for Flexibility:**  
   You can pass in the environment dynamically when you build:
   ```bash
   docker build --build-arg ENVIRONMENT=dev .
   ```

4. **Add a Safety Check to `docker-compose.yml`:**  
   To prevent using dev settings in production:
   ```yml
   environment:
     DEBUG: ${DEBUG}
   ```

---

## **How to Explain It to the Team:**
1. During development, source the `.env.dev` file:
   ```bash
   source .env.dev
   docker-compose up -d --build
   ```

2. When ready to deploy to production:
   - Switch to the `.env.prod` file:
     ```bash
     source .env.prod
     docker-compose up -d --build
     ```

3. Make sure the `.env` file you’re using reflects the environment you’re targeting.

---

## **Why This Works:**
✔️ Keeps development and production settings separate.  
✔️ Avoids accidental deployment of debug configurations.  
✔️ Keeps sensitive production credentials out of source control.  
✔️ Provides an easy way for developers to switch between environments.  

---

### **You’re building a professional, scalable workflow. This is exactly how the pros do it!** 😎

Add a Safety Check to docker-compose.yml:
To prevent using dev settings in production:
yml:
environment:
  DEBUG: ${DEBUG}






May add a override file for project specific changes:
<!-- 
version: '3'
services:
  wordpress:
    environment:
      WORDPRESS_DB_NAME: wp_project1
      WORDPRESS_DB_USER: user_project1 
      -->


