#!/bin/sh

### プロジェクトフォルダパス
PRODIR="/var/www/project"

### プラグインフォルダパス
PLGDIR="/var/www/html/wp-content/plugins"
### プラグイン名
PLGNAME="hamahama"

### プロジェクトにプラグインフォルダ作成、プラグインフォルダからシンボリックリンク
mkdir $PRODIR/$PLGNAME
cd $PLGDIR || exit
ln -s $PRODIR/$PLGNAME .

# wordpressプラグインとして初期化（このコマンドは、プラグインディレクトリから実行で良い）
wp --allow-root scaffold plugin $PLGNAME
wp --allow-root --force scaffold plugin-tests $PLGNAME

# phpunitインストール
cd $PLGDIR/$PLGNAME || exit
composer require --dev phpunit/phpunit:7.5.20
