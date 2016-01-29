require 'sinatra'
require 'json'

post '/gateway' do
  puts params
  puts ENV["TOKEN"]
  puts ENV["REPLY_WORDS"]
  puts ENV["CHANNELS"]
end

def respond_message message
  content_type :json
  {text: message}.to_json
end
