FROM mcr.microsoft.com/playwright

## Install Git
RUN apt update && apt install git && git --version

## Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt update \
  && apt install yarn \
  && yarn --version

## Install Docker
RUN curl -sL "https://download.docker.com/linux/static/stable/$(uname -m)/docker-19.03.9.tgz" \
  | tar xzvf - -C /usr/local/bin/ --strip-components=1

## Install Docker Compose
RUN curl -sL "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
  && chmod +x /usr/local/bin/docker-compose \
  && docker-compose --version
