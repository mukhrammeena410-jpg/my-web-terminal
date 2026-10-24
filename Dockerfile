FROM ubuntu:latest

# Update aur zaroori packages install karein (Python aur bot ki libs ke saath)
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    python3 \
    python3-pip \
    python3-venv \
    tmux \
    git \
    libgl1 \
    libglib2.0-0 \
    && apt-get clean

# ttyd (Web Terminal) install karein
RUN wget -qO /usr/local/bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 && chmod +x /usr/local/bin/ttyd

# Working directory set karein
WORKDIR /app

# Railway ka jo bhi port ho, usko use karein. Admin username aur password set karein.
# Yahan 'admin:admin123' ki jagah apna username:password rakh lein
CMD ttyd -p $PORT -c admin:admin123 bash
