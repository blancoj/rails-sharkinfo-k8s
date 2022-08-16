#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

 # bundle exec sidekiq
 SECRET_KEY_BASE="sidekiq_startup" RAILS_ENV=production bundle exec sidekiq
