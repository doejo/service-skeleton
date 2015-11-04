FROM ruby:2.2
MAINTAINER dan@doejo.com

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
WORKDIR /app
RUN bundle install --deployment --without development,test
ADD . /app

EXPOSE 5000
CMD ["bundle", "exec", "foreman", "start"]