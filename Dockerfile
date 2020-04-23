FROM alpine:3.2

RUN apk --update add ruby ruby-dev ruby-irb ruby-io-console ruby-json ruby-rake ruby-bundler ruby-nokogiri zlib-dev jpeg-dev libpng-dev ca-certificates build-base libxml2-dev libxslt-dev libffi-dev openssl-dev nodejs

WORKDIR /myapp

COPY Gemfile* /myapp/
RUN echo 'gem: --no-ri --no-rdoc' > /etc/gemrc && \
  bundle config build.nokogiri --use-system-libraries && \
  bundle install -j4

COPY . /myapp
CMD ["bundle", "exec", "middleman", "server"]
