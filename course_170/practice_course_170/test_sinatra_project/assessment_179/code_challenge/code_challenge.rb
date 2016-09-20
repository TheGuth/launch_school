require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require 'pry'

configure do
  enable :sessions
  set :session_secret, 'secret'
end

get "/" do
  session[:amount] ||= 100
  erb :home
end

post "/" do
  @bet = params[:bet].to_i
  @amount = session[:amount]
  @random_number = Random.rand(3) + 1
  @guess = params[:guess]

  if @bet > @amount || @bet < 1
    session[:message] = "Bets must be between $1 and $#{session[:amount]}."
    redirect "/"
  end

  if @guess.to_i == @random_number
    session[:amount] += @bet
    session[:message] = "You have guessed correctly."
  else
    session[:amount] -= @bet
    session[:message] = "You guessed #{@guess}, but the number was #{@random_number}"
  end

  if session[:amount] > 0
    redirect "/"
  else
    redirect "/broke"
  end
end

get "/broke" do
  session[:message] = "You have lost all your money."
end