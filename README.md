# 圧縮アルゴリズム学習

## 目的
学習のためにbzip2を実装する。

## 設計
圧縮処理は以下のように行われる。

1. ブロックソート変換（Burrows-Wheeler Transform）
2. Move-To-Front（先頭移動法）＋ランレングス（RLE）符号化
3. ハフマン符号化

## メモ

Docker内で実行する場合

```bash
docker compose up -d
docker compose exec ruby /bin/bash
```
