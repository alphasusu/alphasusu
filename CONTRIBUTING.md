# Developing and Contributing

To get started, checkout the source code and make sure you can get it run.

```
bundle install

cp config/database.yml.example config/database.yml

git submodule update --init

bundle exec rake db:setup
bundle exec rake import:all

bundle exec rails s```

These steps have been tested multiple times on OS X and Linux but are
untested on Windows. Reports of success or failure on any platform are
appreciated.

Now just make changes and check they work. If they do, commit them to
a branch somewhere and open a pull request.