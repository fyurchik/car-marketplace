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
5. Start the Rails Server
   ```bash
   bin/dev
   ```
