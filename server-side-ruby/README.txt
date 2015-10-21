This is a simple Sinatra application that can be hosted on your server,
or easily hosted on a PaaS like Heroku, Digital Ocean, etc.

The database is assumed to be PostgreSQL, and is configured via the
DATABASE_URL environment variable.

This version of the server-side code allows you to track multiple users
by allowing for separate GET requests that include the user's name. The
default user is the "I" user.

To run this locally...
  < create your local database >
  $ gem install bundler
  $ bundle install
  $ bundle exec rake db:migrate
  $ bundle exec rackup config.ru --port <default:9292> \
    --server <default:webrick> \
    --host <default:localhost>
  $ open http://host:port/

Create your local database...

    $ createdb self-hosted-gps-tracker-dev

When you install the Android app, point your tracking URL to http(s)://<your host>/track
for the default "I" user, or http(s)://<your host>/track/<name> for a named user.
