# 圧縮アルゴリズム学習

## 目的
学習のためにbzip2を模倣した圧縮・解凍プログラム実装する。

## 設計
bzip2の圧縮処理には以下の要素が用いられている。

1. ブロックソート変換（Burrows-Wheeler Transform）
2. Move-To-Front（先頭移動法）
3. ランレングス符号化（RLE）
4. ハフマン符号化

これらを用いて実装する。

## メモ

Docker内で実行する場合

```bash
docker compose up -d
docker compose exec ruby /bin/bash

# 圧縮
docker compose exec ruby ./compress source_path destination_path
docker compose exec ruby ./decompress source_path destination_path
```
