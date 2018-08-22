FROM ruby:2.3.3
COPY . /app
WORKDIR /app
USER root
ENV MYSQL_URL=mysql
ENV SQL_USER=root
ENV SQL_PASS=526113
RUN gem install bundler && bundle install
EXPOSE 3000
CMD rails s