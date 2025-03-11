# Use official Node.js image
FROM node:20

# Set working directory
WORKDIR /cloudrunupload

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

# Copy app files
COPY . .

# Expose port for Cloud Run
EXPOSE 8080

# Start app
CMD ["npx", "@google-cloud/functions-framework", "--target=corporateServicesWebhook"]
