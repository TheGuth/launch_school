require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

gets "/show/:name" do
  client.puts params[:name]
end