#!/bin/bash
# 初回起動時のセットアップ
set -e

# VNCパスワード設定（共用パスワード: shortstay）
echo "shortstay" | vncpasswd -f > /home/vmpcuser/.vnc/passwd
chown vmpcuser:vmpcuser /home/vmpcuser/.vnc/passwd
chmod 600 /home/vmpcuser/.vnc/passwd

# XFCE初期化
export USER=vmpcuser
export HOME=/home/vmpcuser
sudo -u vmpcuser xfce4-session &
sleep 2

# VNCサーバ起動
sudo -u vmpcuser vncserver :1 -geometry 1280x800 -localhost

# noVNC起動（5901→6080）
websockify --web=/usr/share/novnc/ 6080 localhost:5901 &