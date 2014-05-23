require "sinatra"
require_relative "lib/command_centre"

get '/' do
  @report = "<-----------\nEnter some instructions"
  erb :index
end

post '/' do
  redirect '/'
end