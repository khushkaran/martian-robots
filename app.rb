require "sinatra"
require_relative "lib/command_centre"

enable :sessions
set :session_secret, 'badgerbadgerbadgermushroommushroom'

get '/' do
  @report = session[:report] ? session[:report] : "<-----------\nEnter some instructions"
  erb :index
end

post '/' do
  comcen = CommandCentre.new(params[:instructions])
  session[:report] = comcen.mars.earth_report
  redirect '/'
end