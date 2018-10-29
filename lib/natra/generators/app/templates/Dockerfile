FROM ruby AS base
WORKDIR /usr/src/app
RUN gem install bundler
COPY Gemfile /usr/src/app/
FROM base AS development
RUN bundle install -j5 --without staging production
COPY . /usr/src/app
FROM base AS release
RUN bundle install -j5 --without development test
COPY . /usr/src/app
CMD puma
