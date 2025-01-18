# syntax=docker/dockerfile:1
# GitHub Webhook test

FROM node:lts-alpine

# Install necessary build tools and dependencies
RUN apk add --no-cache python3 make g++ libc6-compat

WORKDIR /app

# Copy project files
COPY . .

# Install dependencies, ignoring optional ones to avoid unnecessary failures
RUN yarn install --production --ignore-optional

# Expose the application port
EXPOSE 3000

# Run the application
CMD ["node", "src/index.js"]