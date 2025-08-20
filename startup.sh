#!/bin/bash
# 準備: ディレクトリやパスワードファイルはrootでOK

mkdir -p /home/vmpcuser/.vnc
echo "shortstay" | vncpasswd -f > /home/vmpcuser/.vnc/passwd
chown -R vmpcuser:vmpcuser /home/vmpcuser/.vnc
chmod 700 /home/vmpcuser/.vnc
chmod 600 /home/vmpcuser/.vnc/passwd

# xstartupの設置（必要であれば）
cat <<EOF > /home/vmpcuser/.vnc/xstartup
#!/bin/sh
xrdb \$HOME/.Xresources
dbus-launch --exit-with-session startxfce4 &
EOF
chmod +x /home/vmpcuser/.vnc/xstartup
chown vmpcuser:vmpcuser /home/vmpcuser/.vnc/xstartup

# VNCサーバは、vmpcuser権限で起動する
sudo -u vmpcuser vncserver :1