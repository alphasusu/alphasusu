# Developing and Contributing

### Getting Started

To get started, checkout the source code and make sure you can get it run.

```
bundle install

cp config/database.yml.example config/database.yml

git submodule update --init

bundle exec rake db:setup
bundle exec rake import:all

bundle exec rails s
```

These steps have been tested multiple times on OS X and Linux but are
untested on Windows. Reports of success or failure on any platform are
appreciated.


### Reporting Issues

We welcome *anyone* to open issues on Alpha SUSU, especially students who
may or may not have previous experience with software development and project
management.

Don't be afraid to report an issue, however small it is. Typos, style errors,
or missing features are all welcome, as are ways to improve the project process.

The only thing we ask that you don't open issues for is security vulnerabilities.
These should be reported to the [project maintainers](https://github.com/orgs/alphasusu/members) using the emails listed
on our GitHub profiles, and messages should be encrypted with PGP if possible.


### Contributing Code

We are open to ideas for changes in the form of pull-requests, but if you
are about to implement a large feature or change, open an issue first and
discuss it with us. We don't want to throw away work because we're already
working on it, or it needs to be implemented in a different way.
