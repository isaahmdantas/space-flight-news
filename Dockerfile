FROM ruby:3.1.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs cron

WORKDIR /var/www/space-flight-news-api
COPY Gemfile /var/www/space-flight-news-api/Gemfile
COPY Gemfile.lock /var/www/space-flight-news-api/Gemfile.lock

RUN bundle install

COPY . .

RUN whenever --update-crontab

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
