# README

Powered by shirasagi (https://github.com/shirasagi/shirasagi)

## Tested Platforms
* Ubuntu 20.04.4 LTS(ARM64)

## Install
Checkout this git repo.

`$ git clone https://github.com/mssibain/shirasagi-docker.git`

Build ruby image.

`$ bash build.sh`

## Optional: Change settings

If use https, unccoment and edit <<your.domain>> docker-compose.yml.
and remove ports section in nginx service.

```
  # https-portal:
  #   image: steveltn/https-portal:1
  #   container_name: shirasagi_https-portal
  #   ports:
  #     - '80:80'
  #     - '443:443'
  #   environment:
  #     DOMAINS: >-
  #       your.domain -> http://nginx
  #     # STAGE: 'production' # Don't use production until staging works
  #     WORKER_PROCESSES: auto
  #     WORKER_CONNECTIONS: 2048
  #     CLIENT_MAX_BODY_SIZE: '128M'
  #   links:
  #     - nginx
  #   volumes:
  #     - ./certs:/var/lib/https-portal
  #   restart: always
```


## Run

Wakeup docker container.

`$ sudo docker compose up -d`

_**Attention**_

*The gem is built when the system is first started (including rebuilds).

*The build process takes a considerable amount of time.

After the build is finished, access the following URL with a browser

< http://localhost/.mypage/login >


## Initial User Add

After confirming that the URL is accessible, register an administrative user.

1:
`$ sudo docker compose exec -it shirasagi /bin/bash`

2:
`$ cd /var/www/shirasagi`

3:
`$ rake ss:create_user data='{ name: "システム管理者", email: "sys@example.jp", password: "pass" }'`

## Notes

*The Nginx port number specified in docker-compose.yml must be consistent across hosts and containers.