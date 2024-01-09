FROM ruby:3.2.0
WORKDIR /usr/src/app
COPY Gemfile* ./
# Install dependencies
RUN bundle install
# Copy the rest of your application's code
COPY . .
RUN rm -f db/*.sqlite3
RUN rake db:create
RUN RAILS_ENV=development bundle exec rake db:migrate
CMD ["rails", "server", "-b", "0.0.0.0"]

# docker build -t ror-sample .
# docker run -p 3000:3000 ror-sample