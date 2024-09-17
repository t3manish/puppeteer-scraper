# Use the official Node.js image.
FROM node:16

# Create and set the working directory.
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json files.
COPY package*.json ./

# Install the dependencies.
RUN npm install

# Copy the rest of the application files (including index.js).
COPY . .

# Install dependencies for Puppeteer and other required libraries.
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libxrender1 \
    libxtst6 \
    libnss3 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libxss1 \
    libxtst6 \
    libxkbcommon0 \
    libdbus-1-3 \
    libglib2.0-0 \
    libdrm2 \
    libdrm-intel1 \
    libgbm1 \
    libasound2 \
    && rm -rf /var/lib/apt/lists/*

# Run the application.
CMD [ "node", "index.js" ]
