FROM python:slim

RUN apt update && \
    apt upgrade -y && \
    apt install -y g++ gcc make libevent-dev libffi-dev libxml2-dev libxslt-dev \
        zlib1g-dev ffmpeg build-essential libssl-dev libffi-dev \
        python3-dev cargo

RUN rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip

WORKDIR /app
COPY . .

RUN pip3 install -r requirements.txt

ENTRYPOINT [ "python3", "-u", "aniGamerPlus.py" ]
