FROM jruby:9
RUN apt-get update -qq && apt-get install -y build-essential
RUN mkdir /client
WORKDIR /client
ADD Gemfile /client/Gemfile
ADD Gemfile.lock /client/Gemfile.lock
RUN bundle install
ADD . /client
