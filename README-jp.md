# Tezos ハンズオン インストール

## Dockerのインストール

[Docker](https://www.docker.com) をインストールして、動作確認をしてください。

<dl>
<dt>Linux
<dd>Ubuntu ですと `apt install docker.io` でインストールできます。
`sudo` コマンドなしで `docker` を立ち上げられるようにすることをお勧めします。[詳しくは](https://docs.docker.com/install/linux/linux-postinstall/)。この設定をしなかった場合、ハンズオンで行う各コマンド呼び出しには`sudo`をつけなくてはいけなくなります。

<dt>Mac
<dd>[Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/install/)

<dt>Windows + 仮想 Linux 環境
<dd> Windows で一番簡単かつお勧めするのは、VMWare や VirtualPC に Ubuntu をインストールし、そこで Docker をインストールする方法です。演習は Ubuntu 内で行います。

<dt>Windows native
<dd>対象としていません。
</dl>

## イメージのインストール

```
$ docker pull dailambda/tezos-handson:2020-03 ↩️
```

## Git repo のクローン

Git をインストールして、次のコマンドでハンズオンに使うファイルをダウンロードしてください:

```
$ git clone https://gitlab.com/dailambda/docker-tezos-hands-on --branch tezos-hands-on-2020-03-21 ↩️
```

`docker-tezos-hands-on` というディレクトリができます。実習はこのディレクトリ内で行います。
