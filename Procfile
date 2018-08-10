web: bundle exec rails s -p $PORT -e $RACK_ENV
worker: env TERM_CHILD=1 QUEUE=* bundle exec rake resque:work
scheduler: bundle exec rake resque:scheduler
release: bundle exec rake db:migrate