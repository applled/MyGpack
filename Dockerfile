FROM python:3.9

WORKDIR /app

COPY requirements.txt /app/

RUN pip3 install -r requirements.txt

RUN apt -qq update && apt -qq install -y --no-install-recommends \
    gcc python3-dev zlib1g-dev \
    apt-transport-https \
    build-essential coreutils jq pv \
    ffmpeg mediainfo \
    neofetch \
    p7zip-full \
    libfreetype6-dev libjpeg-dev libpng-dev libgif-dev libwebp-dev && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives /tmp/*

COPY . /app

CMD [ "bash", "./start" ]
