FROM ruby:2.5.3-alpine3.8

# Define mount points.
VOLUME /data
VOLUME /data/features/config
VOLUME /data/features/resources
# Define working directory
WORKDIR /data
COPY Gemfile /data

RUN gem install bundler && \
    gem cleanup all

RUN bundle install
COPY . /data

CMD "cucumber"
