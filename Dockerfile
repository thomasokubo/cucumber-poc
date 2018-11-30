FROM ruby:2.2

RUN apt-get update && \
     apt-get upgrade -y && \
     apt-get install -y libgmp3-dev && \
     apt-get install -y ruby-dev && \
     echo deb http://http.debian.net/debian jessie-backports main >> /etc/apt/sources.list && \
     apt-get update && \
     apt install -y -t jessie-backports  openjdk-8-jre-headless ca-certificates-java && \
     apt-get install -y openjdk-8-jre && \
     update-alternatives --config java && \
     apt-get clean


RUN mkdir /data
VOLUME /data
WORKDIR /data

COPY Gemfile /data

RUN gem install bundler && \
    gem cleanup all

RUN bundle install
COPY . /data

CMD "cucumber"












