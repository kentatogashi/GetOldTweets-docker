FROM ubuntu:latest
MAINTAINER kentatogashi

ARG py_ver="3.6.7"
SHELL ["/bin/bash", "-c"]
COPY data/.bash_profile /root/
RUN apt update && \
    apt install -y git gcc make libssl-dev libbz2-dev \
    libreadline-dev libsqlite3-dev zlib1g-dev wget openssl \
    language-pack-ja-base language-pack-ja && \
    git clone git://github.com/yyuu/pyenv.git ~/.pyenv && \
    source /root/.bash_profile && \
    /root/.pyenv/bin/pyenv install ${py_ver} && \
    /root/.pyenv/bin/pyenv global ${py_ver} && \
    git clone https://github.com/Jefferson-Henrique/GetOldTweets-python \
    /root/GetOldTweets-python && \
    source /root/.bash_profile && \
    cd /root/GetOldTweets-python && \
    pip install lxml pyquery
COPY data/search_old_tweets.py /root/GetOldTweets-python/
COPY data/run.sh /root/
