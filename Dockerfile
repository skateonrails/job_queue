FROM ruby:2.3-slim
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
