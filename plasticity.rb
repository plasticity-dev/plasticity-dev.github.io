require 'sinatra'
require 'mail'
require 'postmark'
require 'dotenv'
Dotenv.load

get '/' do
  erb :index
end

post '/contact' do
  if params[:name] && params[:message] && params[:email]
    status = 200
    emailer = Postmark::ApiClient.new(ENV["POSTMARK"])

  # Example request
    emailer.deliver(
    from: 'contact@plasticity-dev.com',
    to: 'contact@plasticity-dev.com',
    subject: 'A message from Plasticity.com',
    text_body: "You have a new message from #{params[:name]}:\n\n #{params[:message]} \n\n Please respond to #{params[:email]}")
  else
    status = 400
  end
  return status
end
