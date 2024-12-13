# Use Ubuntu 18.04 as the base image
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
    vim-common \
    netcat \
    && rm -rf /var/lib/apt/lists/*

# Generate and configure locales
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Enable multi-architecture emulation
RUN update-binfmts --enable qemu-x86_64

# Install Python libraries
RUN pip3 install --upgrade gallery-dl yt-dlp selenium requests beautifulsoup4

# Install geckodriver (Firefox driver)
RUN LATEST_VERSION=$(curl -s https://api.github.com/repos/mozilla/geckodriver/releases/latest | grep "tag_name" | cut -d '"' -f 4 | sed 's/v//') \
    && wget -q "https://github.com/mozilla/geckodriver/releases/download/v${LATEST_VERSION}/geckodriver-v${LATEST_VERSION}-linux64.tar.gz" -O geckodriver.tar.gz \
    && tar -xzf geckodriver.tar.gz -C /usr/local/bin \
    && rm geckodriver.tar.gz

# Configure Tor
RUN mkdir -p /usr/local/var/lib/tor /usr/local/var/log/tor && \
    chown -R debian-tor:debian-tor /usr/local/var/lib/tor /usr/local/var/log/tor && \
    chmod -R 700 /usr/local/var/lib/tor && \
    echo "SocksPort 9050" >> /etc/tor/torrc && \
    echo "ControlPort 9051" >> /etc/tor/torrc && \
    echo "CookieAuthentication 1" >> /etc/tor/torrc && \
    echo "CookieAuthFile /usr/local/var/lib/tor/control_auth_cookie" >> /etc/tor/torrc && \
    echo "Log notice stdout" >> /etc/tor/torrc

# Ensure the cookie file is created
RUN service tor restart && sleep 5

# Set working directory
WORKDIR /root/nsfw_data_scraper

# Copy necessary files
COPY ./ /root/nsfw_data_scraper
COPY .config/gallery-dl/config.json /root/.config/gallery-dl/config.json

# Ensure the config file is readable
RUN chmod 644 /root/.config/gallery-dl/config.json

# Make scripts executable
RUN chmod +x /root/nsfw_data_scraper/scripts/*.sh

# Start Tor and prepare the entry point
CMD ["/bin/bash", "-c", "service tor restart && tail -f /usr/local/var/log/tor/log"]
