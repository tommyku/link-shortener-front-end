require 'firebase'
require 'sinatra'

class App < Sinatra::Base
  get '/' do
    "the time where this server lives is #{Time.now}"
  end

  get '/:short_key' do |short_key|
    base_uri = ENV['FIREBASE_BASE_URI']
    secret_key = ENV['FIREBASE_SECRET_KEY']
    firebase = Firebase::Client.new(base_uri, secret_key)
    response = firebase.get("#{short_key}")
    if response.body
      target = response.body.first[1]
      redirect target
    else
      "I've got nothing for you"
    end
  end
end
