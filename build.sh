#!/bin/bash

if ! ls shirasagi; then
    git clone https://github.com/shirasagi/shirasagi -b v1.16.1
    cd shirasagi
    cp -n config/samples/*.{rb,yml} config/
    sed -i -e 's/localhost/mongodb/' config/mongoid.yml
    cd ..
fi
sudo docker compose build
sudo chmod 0777 shirasagi_image/run.sh