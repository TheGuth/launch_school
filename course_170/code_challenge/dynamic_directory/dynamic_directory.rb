require "sinatra"
require "sinatra/reloader"

get "/" do
  @public_files = Dir.glob("public/*")

end