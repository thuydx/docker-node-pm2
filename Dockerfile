FROM node:25-alpine

# Set environment
ENV NODE_ENV=production \
    APP_HOME=/usr/src/app

WORKDIR $APP_HOME

# Install PM2 globally
RUN npm install -g pm2

# Copy entrypoint & PM2 config
COPY ./ecosystem.config.js ./ecosystem.config.js
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose frontend port
EXPOSE 3000

# Use entrypoint script to handle build/run logic
ENTRYPOINT ["/entrypoint.sh"]
