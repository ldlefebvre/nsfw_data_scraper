# Use Ubuntu 18.04 as the base image for your container
FROM --platform=linux/amd64 ubuntu:18.04

# Install necessary dependencies and qemu for multi-architecture support
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
    && rm -rf /var/lib/apt/lists/*

# Generate and configure locales
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Enable multi-architecture emulation for x86_64
RUN update-binfmts --enable qemu-x86_64

# Install gallery-dl and yt-dlp
RUN pip3 install --upgrade gallery-dl yt-dlp

# Set working directory
WORKDIR /root/nsfw_data_scraper

# Copy the necessary files to the working directory
COPY ./ /root/nsfw_data_scraper

# Make the scripts executable
RUN chmod +x /root/nsfw_data_scraper/scripts/*.sh

# Set the entrypoint for the container
ENTRYPOINT ["/bin/bash", "-c", "echo Hello from the container! && exec /bin/bash"]
