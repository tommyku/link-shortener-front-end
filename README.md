# Link shortener front end

Host your own link shortener that works with a bot. Just send the link
to a bot and it'll take care of the rest for you. Demo:
[@GiveMeShortLinkBot](http://t.me/GiveMeShortLinkBot)

This is the backend (nevermind the repo name) for the link shortener. You need a bot to add links to this link shortener. For source code of the bot see [tommyku/link-shortener-bot](https://github.com/tommyku/link-shortener-bot)

## Getting Started

1. Make sure you have Ruby 2.3.1+ installed and a Firebase database set up
2. Run `bundle install` from project root folder
2. Set the environmental variables `FIREBASE_BASE_URI` and `FIREBASE_SECRET_KEY` in your environment
3. To push some data into the Firebase database, use `bundle exec irb`:

``` ruby
irb> require 'firebase'
irb> firebase = Firebase::Client.new(ENV['FIREBASE_BASE_URI'], ENV['FIREBASE_SECRET_KEY'])
irb> firebase.push('appleorange', 'https://github.com/tommyku/link-shortener-front-end')
irb> response = firebase.get('appleorange')
irb> response.body
{'-somefirebasekey': 'https://github.com/tommyku/link-shortener-front-end'}
```
4. To run the server locally, run `bundle exec ruby -S rackup -w config.ru` and navigate to [http://localhost:9292/appleorange](http://localhost:9292/appleorange), you should have been redirected to [https://github.com/tommyku/link-shortener-front-end](https://github.com/tommyku/link-shortener-front-end)

### Prerequisites

1. Ruby 2.3.1+
1. Set up Firebase database from the [official site](https://firebase.google.com/).

### Installing

After cloning the repo, you should create two environmental variables `FIREBASE_BASE_URI` and `FIREBASE_SECRET_KEY` referring to your to the Firebase realtime database.

To run locally:

``` bash
$ bundle install
$ bundle exec ruby -S rackup -w config.ru
```

## Deployment

This repo is designed to be deployed on [OpenShift](https://www.openshift.com) (the old gen).

### Setting environmental variables on OpenShift

SSH into your OpenShift instance, then:

``` bash
$ cd ~/.env/user_vars
$ echo '...' > FIREBASE_BASE_URI
$ echo '...' > FIREBASE_SECRET_KEY
```

### Git push and deploy

Make sure you do this after setting environmental variables because restarting/reloading an instance does not reload the envs, stopping and starting an instance do.

From the project folder,

``` bash
$ git push master
```

## Built With

* [Sinatra](http://www.sinatrarb.com/) - Web server
* [oscardelben/firebase-ruby](https://github.com/oscardelben/firebase-ruby) - ruby Firebase API wrapper
* [openshift-quickstart/sinatra-example](https://github.com/openshift-quickstart/sinatra-example) - Basis for OpenShift gear