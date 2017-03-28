require 'sinatra'

class App < Sinatra::Base
  get '/' do
    "the time where this server lives is #{Time.now}
      <br /><br />check out your <a href=\"/agent\">user_agent</a>"
  end

  get '/agent' do
    "you're using #{request.user_agent}"
  end

  get '/:short_key' do |short_key|
    "you mean #{short_key}"
  end
end
