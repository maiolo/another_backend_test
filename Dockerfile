FROM ruby:2.7.4

COPY . ./

WORKDIR /another_backend_test

ENV RAILS_ENV production

RUN gem install bundler:2.2.32 \
    && bundle install 


CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]