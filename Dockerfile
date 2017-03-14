FROM ruby:2.3-slim

# set locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential git netcat

RUN mkdir /job_queue
WORKDIR /job_queue

ADD Gemfile /job_queue/Gemfile
ADD Gemfile.lock /job_queue/Gemfile.lock
RUN gem install bundler
RUN gem install rake
RUN bundle install
ADD . /job_queue
