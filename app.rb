require 'sinatra'
require 'json'

post '/gateway' do
  return if params[:token] != ENV["TOKEN"]
  return if !ENV["CHANNELS"].nil? && !ENV["CHANNELS"].split(",").include?(params[:channel_name])
  
  reply_words = ENV["REPLY_WORDS"].split(",")
  respond_message(reply_words[rand(reply_words.size)])
end

def respond_message(message)
  content_type :json
  {text: message}.to_json
end
