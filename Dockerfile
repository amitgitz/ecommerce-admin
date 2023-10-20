# Use an official Node runtime as the base image
FROM node:18

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json before other files
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy Prisma schema
COPY prisma/schema.prisma ./prisma/schema.prisma

# Generate Prisma Client
RUN npx prisma generate

# Copy the rest of the project
COPY . .

# COPY .env .env

# Build the Next.js app
RUN npm run build

# Expose port 3000 for the app to listen on
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
