FROM jruby:9
RUN apt-get update -qq && apt-get install -y build-essential
RUN mkdir /server
WORKDIR /server
ADD Gemfile /server/Gemfile
ADD Gemfile.lock /server/Gemfile.lock
RUN bundle install
ADD . /server
