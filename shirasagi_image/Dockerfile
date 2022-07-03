FROM ruby:3.0.4-slim-buster
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install \
    imagemagick \
    libmagickcore-dev \
    libmagickwand-dev \
    gnupg2 \
    wget \
    curl \
    git \
    make \
    g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN gem install bundler --no-document
RUN bundle config set --global force_ruby_platform true

# エントリーポイント作成
# RUN echo '#!/bin/bash\nexec /bin/bash -l -c "$*"' > /entrypoint.sh && chmod +x /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]