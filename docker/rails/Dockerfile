FROM ruby:3.1.1

RUN apt-get update -qq && apt-get install -y --no-install-recommends nodejs npm

ENV RAILS_ROOT /app
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
COPY . .
RUN mkdir -p tmp/sockets

RUN bundle install
