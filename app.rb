require "sinatra"
require_relative "lib/command_centre"

get '/' do
  erb :index
end