require 'sinatra'
require 'json'

post '/gateway' do
  return if params[:token] != ENV["TOKEN"]
  ENV["CHANNELS"].split(",").include?(params[:channel_name])
  
  reply_words = ENV["REPLY_WORDS"].split(",")
  respond_message(reply_words[rand(reply_words.size - 1)])
end

def respond_message(message)
  content_type :json
  {text: message}.to_json
end
