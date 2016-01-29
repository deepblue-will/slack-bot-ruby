require 'sinatra'
require 'json'

post '/gateway' do
  logger.info params
  logger.info ENV["TOKEN"]
  logger.info ENV["REPLY_WORDS"]
  logger.info ENV["CHANNELS"]
end

def respond_message message
  content_type :json
  {text: message}.to_json
end
