# Ubuntuベースイメージ（22.04 LTS）
FROM ubuntu:22.04

# 必要な環境変数
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

# 必要なパッケージのインストール
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        locales \
        sudo \
        xfce4 \
        xfce4-goodies \
        tightvncserver \
        novnc \
        websockify \
        supervisor \
        wget \
        fonts-ipafont-gothic \
        fonts-ipafont-mincho \
        ibus-mozc \
        dbus-x11 \
        firefox \
        xterm \
        && \
    locale-gen ja_JP.UTF-8 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# VNCユーザー作成
RUN useradd -m -s /bin/bash vmpcuser && echo "vmpcuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER vmpcuser
WORKDIR /home/vmpcuser

# 日本語設定
RUN mkdir -p ~/.config && \
    echo 'export LANG=ja_JP.UTF-8' >> ~/.bashrc && \
    echo 'export LC_ALL=ja_JP.UTF-8' >> ~/.bashrc

# 初回VNCパスワード等のセットアップ
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

# SupervisorでVNC/nvnc両方起動
USER root
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 5901 6080

CMD ["/usr/bin/supervisord"]
