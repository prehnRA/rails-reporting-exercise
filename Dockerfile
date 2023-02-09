FROM ruby:3.2.1-slim

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
  build-essential \
  gnupg2 \
  curl \
  less \
  git \
  libpq-dev \
  postgresql-client \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add Node.js to sources list
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

# Install Node.js version that will enable installation of yarn
RUN apt-get install -y --no-install-recommends \
  nodejs \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /.npm && chown -R 1000 /.npm
RUN npm install -g npm

# Add a script to be executed every time the container starts.
COPY .dockerdev/entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
RUN chown 1000 /usr/bin/entrypoint.sh
COPY .yarnrc /.yarnrc
RUN mkdir -p /usr/src/app/
RUN chown -R 1000 /usr/lib/ /usr/bin/ /.yarnrc /usr/src/app/

USER 1000

# Use what the base image provides rather than create our own  app directory
WORKDIR /usr/src/app/


RUN gem update --system && gem install bundler
RUN npm install -g yarn

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
