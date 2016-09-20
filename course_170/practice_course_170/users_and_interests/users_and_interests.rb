require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "yaml"

before do
  @users = YAML.load_file("data/users.yaml")
end

helpers do
  def count_interests
    total = 0
    @users.each do |user|
      @users[user[0]][:interests].each do
        total += 1
      end
    end
    total
  end

  def count_users
    total = 0
    @users.each do |user|
      total += 1
    end
    total
  end
end

get "/" do
  erb :index
end

get "/:user" do
  @user = params[:user].to_sym
  erb :user
end