#FROM pytorch/pytorch:latest
FROM python:3.10

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN apt-get update && apt-get -qqy install vim ncdu screen git
#RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update \
# && DEBIAN_FRONTEND=noninteractive apt-get -qqy install vim ncdu screen libopenblas-base cmake python3-pip mc wget libportaudio2 ffmpeg git less nano libsm6 libxext6 #libxrender-dev \
# && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .

RUN pip3 install --upgrade pip && python -m pip install spacy
RUN python -m spacy download en_core_web_md
#RUN pip install llvmlite --ignore-installed

# RUN pip3 install --no-deps -r requirements.txt

ENTRYPOINT ["pwd"]
