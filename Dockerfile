# syntax=docker/dockerfile:1

#######################################
# Stage 1: Install dependencies
#######################################
:contentReference[oaicite:1]{index=1}
WORKDIR /app

# Dependencies for possible native modules
:contentReference[oaicite:2]{index=2}

# Copy lock and manifest files for caching
:contentReference[oaicite:3]{index=3}

# Install all dependencies
:contentReference[oaicite:4]{index=4}

#######################################
# Stage 2: Build the Next.js app
#######################################
:contentReference[oaicite:5]{index=5}
WORKDIR /app

# Copy installed dependencies
:contentReference[oaicite:6]{index=6}

# Copy full project
COPY . .

# Build for production
:contentReference[oaicite:7]{index=7}

#######################################
# Stage 3: Prepare production image
#######################################
:contentReference[oaicite:8]{index=8}
WORKDIR /app

# Run in production mode
:contentReference[oaicite:9]{index=9}

# Create non-root user
:contentReference[oaicite:10]{index=10}

# Copy needed files from builder
:contentReference[oaicite:11]{index=11}
:contentReference[oaicite:12]{index=12}
:contentReference[oaicite:13]{index=13}
:contentReference[oaicite:14]{index=14}

# Ensure permissions
:contentReference[oaicite:15]{index=15}

# Use non-root user
USER appuser

# Expose the default Next.js port
EXPOSE 3000

# Start Next.js production server
:contentReference[oaicite:16]{index=16}
