# Alpha SUSU

[![AlphaSUSU](https://travis-ci.org/alphasusu/alphasusu.png)](https://travis-ci.org/alphasusu/alphasusu)

## Introduction

Alpha SUSU is an (unaffiliated) project for those of us within
Southampton University Students Union who feel that a website built on
modern principles should be a high priority. It was started by
@danpalmer and @ElliotJH.

Our goals with this project are to take a User First philosophy. That
means that we try to test things with real users. It also means that
when we take a feature, our first priority is how we think an average
student (who is probably not all that interested in SUSU) will use it.

We'd love you to get involved. This is a fairly young project so
almost any pull request you make will probably be useful!

We're really keen that those in the University who can contribute
do. The biggest problem with the SUSU website at the moment is that
student involvement is fairly minimal.

## Licensing

The MIT License (MIT)

This project is Copyright (c) 2014 Elliot Hughes and Dan Palmer.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

## Developing and Contributing

To get started, checkout the source code and make sure you can get it run.

``
bundle install

cp config/database.yml.example config/database.yml

git submodule update --init

bundle exec rake db:setup
bundle exec rake import:all

bundle exec rails s``

These steps have been tested multiple times on OS X and Linux but are
untested on Windows. Reports of success or failure on any platform are
appreciated.

Now just make changes and check they work. If they do, commit them to
a branch somewhere and open a pull request.

## Deploying

If you have a deploy key then you can put your update live at cloud.elliothughes.me

To do this type cap production deploy

If you would like to deploy to your own server, create a cap config file suited to it, deploy should 'just work'


