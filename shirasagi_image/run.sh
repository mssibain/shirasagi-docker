#!/bin/bash

cd /var/www/shirasagi

# It takes a considerable amount of time.
bundle config set --local without 'development test'
bundle config set --local path 'vendor/bundle'
bundle install

# Launch
rake unicorn:start

# なぜか、rakeのバージョンが古い。。とりあえずgemで最新入れてもう一度bundle installしたら大丈夫
# ここでダメな理由はいつか調べる
gem install rake
bundle install
bundle exec rake unicorn:start

# Do not terminate
bash