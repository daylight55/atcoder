#!/bin/bash

cd `dirname $0`

# Install atcoder tools
npm install -g atcoder-cli
pip3 install online-judge-tools

# テンプレートのシンボリックリンク作成 (for Mac)
ln -s $PWD/acc_templates/ruby/main.rb $HOME/Library/Preferences/atcoder-cli-nodejs/ruby/main.rb
ln -s $PWD/acc_templates/ruby/template.json $HOME/Library/Preferences/atcoder-cli-nodejs/ruby/template.json
