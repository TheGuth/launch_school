require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, 'secret'
end

before do 
  session[:contacts] ||= []
end

get "/" do
  redirect "/contacts"
end

get "/contacts" do
  @list = session[:contacts]
erb :index
end

get "/contacts/new" do

  erb :new_contact
end

post "/contacts" do
  session[:contacts] << { name: params[:contact_name], 
                          phone_number: params[:phone_number],
                          email: params[:email] }

  redirect "/contacts"
end

get "/contacts/:index" do
  @contact = params[:index].to_i
  @list = session[:contacts][@contact]
  erb :contact
end

post "/contacts/:index/delete" do

end

get "/contacts/:index/edit" do
  
end