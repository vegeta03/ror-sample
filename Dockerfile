FROM ruby:3.2.0
WORKDIR /usr/src/app
COPY Gemfile* ./
# Install dependencies
RUN bundle install
# Copy the rest of your application's code
COPY . .
CMD ["rails", "server", "-b", "0.0.0.0"]

# docker build -t ror-sample .
# docker run -p 8080:3000 ror-sample