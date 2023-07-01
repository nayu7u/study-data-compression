# bzip2を実装

## 設計
圧縮処理は以下のように行われる。

1. ブロックソート変換（Burrows-Wheeler Transform）
2. Move-To-Front（先頭移動法）＋ランレングス（RLE）符号化
3. ハフマン符号化
