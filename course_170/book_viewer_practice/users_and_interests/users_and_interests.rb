require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "yaml"
require 'pry'

before do
  @users = YAML.load_file("users.yaml")
end

get "/" do
  erb :users
end

helpers do
  def count_interests
    @total = 0
    @users.each_key do |key|
      @users[key].each do |info|
        @total += @users[key][:interests].count
      end
    end
    @total / 2
  end

  def count_users
    @user_total = 0
    @users.each_key do |key|
      @user_total += 1 if key
    end
    @user_total
  end
end

get "/user_view/:name" do
  @name = params[:name]

  erb :user_view
end
