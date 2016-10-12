require 'sinatra'
require 'mail'
require 'postmark'

get '/' do
  erb :index
end
