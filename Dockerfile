# Base image: Ruby with necessary dependencies for Jekyll
FROM ruby:3.2

# Install dependencies
# Added sudo, net-tools, iproute2, procps, curl, wget, git for DevContainer compatibility
RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
    sudo \
    net-tools \
    iproute2 \
    procps \
    curl \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Copy Gemfile and Gemfile.lock (if exists)
COPY Gemfile ./

# Install bundler and dependencies as root
RUN gem install bundler:2.4.19
RUN bundle install

# Create a non-root user with UID 1000
RUN groupadd -g 1000 vscode \
    && useradd -m -u 1000 -g 1000 -s /bin/bash vscode \
    && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set ownership
RUN chown -R vscode:vscode /usr/src/app

# Switch to non-root user
USER vscode

# Command to serve the Jekyll site
CMD ["jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000"]
