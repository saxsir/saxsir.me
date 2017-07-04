---
title: "hugoでブログをつくる（ローカル開発編）"
slug: "generate-your-blog-with-hugo"
date: 2017-07-02T15:12:57+09:00
tags: ["hugo"]
categories: ["tech"]

---

# TL;DR
* hugoでブログをつくったのでやったことを書いた
* 一番時間がかかるのはテーマ選び
* ローカルでの開発についてのみ書いた（デプロイは別記事で）

# Contents
1. インストール
2. テーマ選び
3. 最初の記事を書く

## インストール

[公式RepositoryのREADME](https://github.com/gohugoio/hugo#choose-how-to-install)に書いてあるのが分かりやすい.

Macでhomebrewを入れてたら

```shell
$ brew install hugo
```

が一番楽。

homebrewは入ってないけどgoの環境があれば

```shell
$ go get -v github.com/gohugoio/hugo
```

で入るのでお好みで。

すごい簡単なので、とりあえずサイトをつくってみる。

```shell
$ hugo new site saxsir.me
Congratulations! Your new Hugo site is created in /Users/saxsir/src/github.com/saxsir/saxsir.me.

Just  few more steps and you're ready to go:

1. Download a theme into the ...
/Users/saxsir/src/github.com/gohugoio/hugoBasicExampleame-named folder.
   Choose a theme from https://themes.gohugo.io/, or
   create your own with the "hugo new theme <THEMENAME>" command.
2. Perhaps you want to add some content. You can add single files
   with "hugo new <SECTIONNAME>/<FILENAME>.<FORMAT>".
3. Start the built-in live server via "hugo server".

Visit https://gohugo.io/ for quickstart guide and full documentation.
```

丁寧にやることも書いてくれる。

ちなみにhugoのversionは

```shell
$ hugo version
Hugo Static Site Generator v0.25-DEV darwin/amd64 BuildDate: 2017-07-01T22:54:08+09:00
```

でお試し中。

## テーマ選び

hugo, 簡単すぎるのでテーマを選ぶのが一番大変かもしれない。

https://github.com/gohugoio/hugoBasicExample を入れてみて、いろいろテーマを見てみるのが良いかも。

自分はとりあえずテーマは後で決める or 自分でつくればいいかなーと思ったので、とりあえず軽いやつを入れてみた。

```shell
$ pwd
/Users/saxsir/src/github.com/gohugoio/hugoBasicExample
$ du -d 1 -h ./themes | grep "K" | sort -n | head
28K     ./themes/_script
140K    ./themes/html5
156K    ./themes/hugo-lithium-theme
164K    ./themes/hugo-xmin
188K    ./themes/hugo-zen
204K    ./themes/anybodyhome
240K    ./themes/detox
280K    ./themes/base16
280K    ./themes/liquorice
320K    ./themes/hugo-hello-programmer-theme
```

このへんがサイズが小さくて良さそうなので、あとはお好みで適当に選ぶのが良さそう。

https://themes.gohugo.io/ でサンプルが見られる。

とりあえずテーマを決めたら `themes` ディレクトリ配下にcloneしてくる。

`.gitignore` とかでignoreすると良さそう。

## 最初の記事を書く

```shell
$ hugo new post/my-first-post.md
```

とかすると、`contents/post/` 配下にmarkdownファイルが作成される。

```shell
$ hugo server -D
```

でdraftの記事もビルドしてくれるので、 http://localhost:1313/ にアクセスすれば見れるはず。

```shell
$ tree -L 3 -I "themes|public"
.
├── LICENSE
├── Makefile
├── README.md
├── archetypes
│   └── default.md
├── config.toml
├── content
│   └── post
│       └── first-post.md
├── data
├── layouts
└── static
    ├── css
    └── images
```

こんな感じのディレクトリ構成になっているはず。

長くなってしまったので、WWWに公開したいんじゃーとかは別記事にする予定。
