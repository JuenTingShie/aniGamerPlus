FROM python:slim

RUN apt update && \
    apt upgrade -y 

RUN apt install curl -y

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

RUN apt install -y python3-dev

RUN apt install -y ffmpeg

RUN apt install -y build-essential g++ gcc libevent-dev libxslt-dev ffmpeg libxslt-dev zlib1g-dev libssl-dev libffi-dev

RUN pip3 install --upgrade pip

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN pip3 install -r requirements.txt

ENTRYPOINT [ "python3", "-u", "aniGamerPlus.py" ]
