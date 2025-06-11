# syntax=docker/dockerfile:1

#######################################
# Stage 1: Install dependencies
#######################################
FROM node:18-alpine AS deps
WORKDIR /app

# Dependencies for native modules (if needed)
RUN apk add --no-cache libc6-compat

# Copy lock and manifest files (for caching)
COPY package.json package-lock.json ./

RUN npm ci

#######################################
# Stage 2: Build the Next.js app
#######################################
FROM node:18-alpine AS builder
WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN npm run build

#######################################
# Stage 3: Prepare production image
#######################################
FROM node:18-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production

# Create and switch to non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

EXPOSE 3000
CMD ["npm", "start"]
