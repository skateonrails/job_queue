FROM ruby:2.3-alpine

RUN apk add --no-cache git
RUN apk --update add --virtual build_deps \
build-base ruby-dev libc-dev linux-headers \
openssl-dev

RUN mkdir /job_queue
WORKDIR /job_queue

ADD Gemfile /job_queue/Gemfile
ADD Gemfile.lock /job_queue/Gemfile.lock
RUN gem install bundler
RUN gem install rake
RUN bundle install
ADD . /job_queue

CMD ruby runner.rb
