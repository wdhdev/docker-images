FROM debian:bullseye-slim

RUN apt update \
    && apt upgrade -y \
    && apt -y install cmake curl dnsutils git jq liblzma-dev locales lzma neofetch software-properties-common speedtest-cli sudo unzip wget zip \
    && useradd -m --home /home/container --shell /bin/bash -u 999 container

# Generate and set the locale to en_US.UTF-8
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

# Ensure UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Node.js Latest LTS
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt -y install nodejs ffmpeg make build-essential

# Update npm
RUN npm install -g npm@latest

# Install Bun
RUN curl "https://github.com/oven-sh/bun/releases/latest/download/bun-linux-x64-baseline.zip" -fsSLO --compressed \
    && unzip "bun-linux-x64-baseline.zip" \
    && mv "bun-linux-x64-baseline/bun" /usr/local/bin/bun \
    && rm -f "bun-linux-x64-baseline.zip" \
    && chmod +x /usr/local/bin/bun

# Install NVM
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Install popular Node.js packages
RUN npm install -g nodemon pm2 pnpm ts-node tsc yarn

# Python 3.11 / 3.12
RUN apt update \
    && apt -y install libbz2-dev libffi-dev libgdbm-dev libncurses5-dev libnss3-dev libreadline-dev libsqlite3-dev libssl-dev zlib1g-dev \
    && wget https://www.python.org/ftp/python/3.11.9/Python-3.11.9.tgz \
    && tar -xf Python-3.11.*.tgz \
    && cd Python-3.11.9 \
    && ./configure --enable-optimizations \
    && make -j $(nproc) \
    && make altinstall \
    && cd .. \
    && rm -rf Python-3.11.9 \
    && rm Python-3.11.*.tgz \
    && wget https://www.python.org/ftp/python/3.12.3/Python-3.12.3.tgz \
    && tar -xf Python-3.12.*.tgz \
    && cd Python-3.12.3 \
    && ./configure --enable-optimizations \
    && make -j $(nproc) \
    && make altinstall \
    && cd .. \
    && rm -rf Python-3.12.3 \
    && rm Python-3.12.*.tgz

# Upgrade Pip 3.11 / 3.12
RUN pip3.11 install --upgrade pip \
    && pip3.12 install --upgrade pip

# OpenJDK 21 LTS
RUN apt update \
    && apt install -y libc6-i386 libc6-x32 \
    && wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb -O jdk-21_linux-x64_bin.deb \
    && apt install -y ./jdk-21_linux-x64_bin.deb \
    && rm jdk-21_linux-x64_bin.deb

ENV JAVA_HOME=/usr/lib/jvm/jdk-21/
ENV PATH=$PATH:$JAVA_HOME/bin

# Golang
RUN curl -OL https://golang.org/dl/go1.22.2.linux-amd64.tar.gz \
    && tar -C /usr/local -xvf go1.22.2.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin
ENV GOROOT=/usr/local/go

# .NET Core Runtime and SDK
RUN wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && apt update \
    && apt install -y apt-transport-https \
    && apt update \
    && apt install -y aspnetcore-runtime-6.0 dotnet-sdk-6.0

# Puppeteer
RUN apt install -y \
    fonts-liberation \
    gconf-service \
    libappindicator1 \
    libasound2 \
    libatk1.0-0 \
    libcairo2 \
    libcups2 \
    libfontconfig1 \
    libgbm-dev \
    libgdk-pixbuf2.0-0 \
    libgtk-3-0 \
    libicu-dev \
    libjpeg-dev \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libpng-dev \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    xdg-utils

# Install Fastfetch
RUN wget https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.deb -O /tmp/fastfetch.deb && \
    apt -y install -f /tmp/fastfetch.deb && \
    rm -f /tmp/fastfetch.deb

USER container
ENV USER container
ENV HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
