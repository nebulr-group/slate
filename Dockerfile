FROM ruby:2.6-slim

WORKDIR /srv/slate

EXPOSE 4567

COPY Gemfile .
COPY Gemfile.lock .

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        nodejs
RUN gem install bundler -v 2.4.22
RUN bundle install 
RUN apt-get remove -y build-essential
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

COPY . /srv/slate

RUN chmod +x /srv/slate/slate.sh

ENTRYPOINT ["/srv/slate/slate.sh"]
CMD ["build"]
