# Use Ubuntu 18.04 as the base image for your container
FROM --platform=linux/amd64 ubuntu:18.04

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    wget \
    rsync \
    imagemagick \
    default-jre \
    python3 \
    python3-pip \
    bash \
    qemu-user-static \
    locales \
    ffmpeg \
    bc \
    curl \
    tor \
    firefox \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

# Generate and configure locales
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Enable multi-architecture emulation for x86_64
RUN update-binfmts --enable qemu-x86_64

# Install Selenium and its dependencies
RUN pip3 install --upgrade gallery-dl yt-dlp selenium requests beautifulsoup4

# Install geckodriver (Firefox driver)
RUN wget -q "https://github.com/mozilla/geckodriver/releases/latest/download/geckodriver-v0.33.0-linux64.tar.gz" -O geckodriver.tar.gz \
    && tar -xzf geckodriver.tar.gz -C /usr/local/bin \
    && rm geckodriver.tar.gz

# Configure Tor for use with Selenium
RUN echo "SOCKSPort 9050" >> /etc/tor/torrc && \
    echo "Log notice stdout" >> /etc/tor/torrc

# Set working directory
WORKDIR /root/nsfw_data_scraper

# Copy the necessary files to the working directory
COPY ./ /root/nsfw_data_scraper

# Copy the gallery-dl configuration file
COPY .config/gallery-dl/config.json /root/.config/gallery-dl/config.json

# Ensure the config file is readable
RUN chmod 644 /root/.config/gallery-dl/config.json

# Make the scripts executable
RUN chmod +x /root/nsfw_data_scraper/scripts/*.sh

# Start Tor and prepare the container entry point
CMD service tor start && /bin/bash
