# ショートステイ業務用VMPC Codespace

## 概要
- Ubuntuベース（22.04）
- 4コア（Codespace設定で指定）
- GUI（XFCE4）、日本語環境、フォント・入力（Mozc）対応
- VNC/noVNC同時利用可能
- 共用ユーザー `vmpcuser`（パスワード `shortstay`）

## 起動方法

### Codespace作成時
- 「Machine type」で `4-core` を選択してください。

### 使い方
- Codespaceのターミナルから `http://<codespace-url>:6080` でnoVNC GUIにアクセス可能。
- VNCクライアントは `5901` ポート（パスワード: shortstay）。
- デフォルトのユーザーは `vmpcuser`です。

## Tips
- 日本語入力はMozc（Google日本語入力）を利用できます。
- Firefox（Webブラウザ）もインストール済み。
