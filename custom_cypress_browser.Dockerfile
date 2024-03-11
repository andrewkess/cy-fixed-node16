# Use the specific Cypress browsers image as the base
FROM cypress/browsers:node16.14.2-slim-chrome103-ff102

# Run updates and install necessary packages including 'gnupg'
RUN apt-get update && \
    apt-get install -y curl gnupg && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    apt-get update && \
    # Clean up to reduce image size
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
