# base layer
FROM ruby AS base

WORKDIR /usr/src/app

RUN gem install bundler

COPY Gemfile /usr/src/app/

# development and test layer with all dependencies
FROM base AS development

RUN bundle install -j5 --without staging production

COPY . /usr/src/app

# release layer
FROM base AS release

RUN bundle install -j5 --without development test

COPY . /usr/src/app

CMD puma