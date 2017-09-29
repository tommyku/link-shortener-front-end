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
4. To run the server locally, run `bundle exec ruby app.rb` and navigate to [http://localhost:3000/appleorange](http://localhost:3000/appleorange), you should have been redirected to [https://github.com/tommyku/link-shortener-front-end](https://github.com/tommyku/link-shortener-front-end)

### Prerequisites

1. Ruby 2.3.1+
1. Set up Firebase database from the [official site](https://firebase.google.com/).

### Installing

After cloning the repo, you should create two environmental variables `FIREBASE_BASE_URI` and `FIREBASE_SECRET_KEY` referring to your to the Firebase realtime database.

To run locally:

``` bash
$ bundle install
$ bundle exec ruby app.rb
```

## Deployment

### Building Docker image

SSH into your production environment and build the image there:

``` bash
$ docker build -t link-shortener-front-end .
```

Alternatively, you can build it locally and `sftp`/`scp` it onto the
production server:

``` bash
(local)$ docker build -t link-shortener-front-end .
(local)$ docker save -o link-shortener-front-end link-shortener-front-end
(local)$ scp link-shortener-front-end username@production-server:~/link-shortener-front-end

(prod)$ docker load -i link-shortener-front-end
```

### Run the image

From the project folder,

``` bash
$ docker run -e FIREBASE_BASE_URI=FIREBASE_BASE_URI -e FIREBASE_SECRET_KEY=FIREBASE_SECRET_KEY -e PORT=3000 -p 3000:3000 link-shortener-front-end
```

## Built With

* [Sinatra](http://www.sinatrarb.com/) - Web server
* [oscardelben/firebase-ruby](https://github.com/oscardelben/firebase-ruby) - ruby Firebase API wrapper
