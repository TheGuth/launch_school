require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require 'pry'

get "/" do
  # @data = Dir.glob("public/*") # grabs all files that meet description which
  # the * splat operator says grab everything.
  @data = Dir.glob("public/*").map { |file| File.basename(file) }.sort # grabs all files in a directory
  @data.reverse! if params[:sort] == "desc"

  erb :list
end

# # list.rb
# require "sinatra"
# require "sinatra/reloader"
# require "tilt/erubis"

# get "/" do
#   @files = Dir.glob("public/*").map {|file| File.basename(file) }.sort
#   @files.reverse! if params[:sort] == "desc"
#   erb :list
# end
