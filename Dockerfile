FROM ubuntu:14.04
MAINTAINER dan@doejo.com

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN touch /etc/default/locale && \
    echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale && \
    echo "LANG=en_US.UTF-8" >> /etc/default/locale

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
  autoconf \
  binutils \
  bison \
  build-essential \
  ca-certificates \
  checkinstall \
  curl \
  freetds-bin \
  freetds-dev \
  git \
  libcurl4-openssl-dev \
  libffi-dev \
  libfontconfig1 \
  libgdbm-dev \
  libicu-dev \
  libmysqlclient-dev \
  libmysqlclient18 \
  libncurses5-dev \
  libpq-dev \
  libqt4-dev \
  libreadline-dev \
  libreadline6-dev \
  libssl-dev \
  libssl1.0.0 \
  libxml2 \
  libxml2-dev \
  libxslt-dev \
  libxslt1-dev \
  libyaml-dev \
  mysql-client-5.6 \
  nano \
  ncurses-dev \
  openssl \
  software-properties-common \
  sqlite3 \
  subversion \
  supervisor \
  wget \
  zlib1g \
  zlib1g-dev

RUN add-apt-repository ppa:brightbox/ruby-ng && apt-get update
RUN apt-get install -y ruby2.2 && apt-get install -y ruby2.2-dev
RUN gem update --system && gem install bundler

RUN rm -rf /tmp/*
RUN for i in /var/log/*.log; do cat /dev/null > $i; done

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
WORKDIR /app
RUN bundle install --deployment --without development,test
ADD . /app