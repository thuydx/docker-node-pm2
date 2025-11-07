FROM node:25-alpine

# Set environment
ENV NODE_ENV=production \
    APP_HOME=/usr/src/app

WORKDIR $APP_HOME

# Install PM2 globally
RUN npm install -g pm2

# Copy package.json & lock files first for caching
#COPY ../../projects/frontend/package*.json ./

# Install dependencies
#RUN npm ci --only=production

# Copy app source (or mount via docker-compose)
#COPY ../../projects/frontend ./

# Expose frontend port
EXPOSE 3000

# Copy PM2 config & entrypoint
COPY ecosystem.config.js ./
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
