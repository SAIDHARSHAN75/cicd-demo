FROM node:18

# Set working directory inside container
WORKDIR /app

# Copy all files from repo root into /app
COPY . .

# Install dependencies
RUN npm install

# Expose port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]


