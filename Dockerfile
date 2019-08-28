FROM phusion/passenger-ruby23

# baseimage-docker boilerplate
ENV HOME /root
CMD ["/sbin/my_init"]

# Enable nginx web server in baseimage-docker
RUN rm -f /etc/service/nginx/down
ADD docker/web/nginx.conf /etc/nginx/sites-enabled/default

USER app
RUN mkdir /home/app/clock
WORKDIR /home/app/clock

# Copy just the Gemfiles before running "bundle install" so
# "bundle install" doesn't rerun every time an unrelated
# source file is changed.
COPY --chown=app:app ./Gemfile* /home/app/clock/
COPY --chown=app:app ./.ruby-version /home/app/clock/
RUN bundle install

COPY --chown=app:app ./ /home/app/clock
# The clock app fails to start at the moment if .env
# doesn't exist. This isn't ideal and should probably
# be fixed.
RUN touch .env

USER root
