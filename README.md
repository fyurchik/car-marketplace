# Setup Instructions

- Ruby (3.1.6)
- Rails (7.1.4)
- PostgreSQL
- Bundler (2.5.11)

## Initial Setup

1. **Clone the repository**
   ```bash
   git clone repo-url
   cd repo-name
   ```
2. Install dependencies
   ```bash
   bundle install
   ```
3. Set up PostgreSQL
   ```bash
   rails db:create
   rails db:migrate
   ```
4. Seed to have admin
   ```bash
   rails db:seed
   ```
   
   ## Aadmin data to sign in

   login: ```admin@admin.com```
   password: ```admin123```
   
6. Start the Rails Server
   ```bash
   bin/dev
   ```

# API Documentation

### Admin Endpoints

#### 1. Get All Posts (Admin)
- **URL:** `/admin/posts`
- **Method:** `GET`
- **Auth Required:** Yes (Admin role)
- **Description:** Retrieves all posts available to the admin.

#### 2. Show Post (Admin)
- **URL:** `/admin/posts/:id`
- **Method:** `GET`
- **Auth Required:** Yes (Admin role)
- **URL Parameters:** `id=[integer]` — ID of the post to retrieve.

#### 3. Approve Post (Admin)
- **URL:** `/admin/posts/:id/approve`
- **Method:** `PATCH`
- **Auth Required:** Yes (Admin role)
- **URL Parameters:** `id=[integer]` — ID of the post to approve.

#### 4. Reject Post (Admin)
- **URL:** `/admin/posts/:id/reject`
- **Method:** `PATCH`
- **Auth Required:** Yes (Admin role)
- **URL Parameters:** `id=[integer]` — ID of the post to reject.

### User Endpoints

#### 5. Get All Posts (User)
- **URL:** `/posts`
- **Method:** `GET`
- **Auth Required:** Yes (User role)
- **Description:** Retrieves all posts created by the current logged-in user.

#### 6. Show Post (User)
- **URL:** `/posts/:id`
- **Method:** `GET`
- **Auth Required:** Yes (User role)
- **URL Parameters:** `id=[integer]` — ID of the post to retrieve.

#### 7. Create Post (User)
- **URL:** `/posts`
- **Method:** `POST`
- **Auth Required:** Yes (User role)
- **Content-Type:** `multipart/form-data`
- **Description:** Creates a new post with the provided parameters. Image upload is required.
- **Request Body Fields:** (All fields are required)
  - `brand`: String
  - `model`: String
  - `body_type`: String
  - `mileage`: Integer
  - `color`: String
  - `price`: Integer
  - `fuel`: String
  - `year`: Integer
  - `engine_capacity`: Float
  - `phone_number`: String
  - `name`: String
  - `image`: File (image file, required)
  - `status`: String (default: "pending")

#### 8. Update Post (User)
- **URL:** `/posts/:id`
- **Method:** `PATCH`
- **Auth Required:** Yes (User role)
- **URL Parameters:** `id=[integer]` — ID of the post to update.

#### 9. Delete Post (User)
- **URL:** `/posts/:id`
- **Method:** `DELETE`
- **Auth Required:** Yes (User role)
- **URL Parameters:** `id=[integer]` — ID of the post to delete.



