require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/content_for'
require 'tilt/erubis'

configure do
  enable :sessions
  set :session_secret, 'secret'
end

helpers do
  # Checks if all todos are completed
  def completed_list(list_index)
    @total = finished_todos(list_index)
    return "" if @list[:todos].empty?
    if @total == @list[:todos].size
      "complete"
    else
      ""
    end
  end
  # Returns total number of todos that are completed
  def finished_todos(list_index)
    @list = session[:lists][list_index]
    @total = 0
    
    @list[:todos].each do |todo|
      return false if @list[:todos].empty?
      if todo[:completed] == true
        @total += 1
      end
    end
    @total
  end

  def todos_count(list)
    list[:todos].size
  end

  def todos_remaining_count(list)
    list[:todos].select { |todo| !todo[:completed] }.size
  end

  def list_complete?(list)
    todos_count(list) > 0 && todos_remaining_count(list) == 0
  end

  def sort_lists(lists, &block)
    complete_lists, incomplete_lists = lists.partition { |list| list_complete?(list) }

    incomplete_lists.each { |list| yield list, lists.index(list) }
    complete_lists.each { |list| yield list, lists.index(list) }
  end

  def sort_todos(todos, &block)
    complete_todos, incomplete_todos = todos.partition { |todo| todo[:completed] }

    incomplete_todos.each { |todo| yield todo, todos.index(todo) }
    complete_todos.each { |todo| yield todo, todos.index(todo) }
  end
end

# either pass session[:lists] or session[:lists] as an empty array
before do
  session[:lists] ||= []
end

# home route redirects to /lists
get '/' do
  redirect '/lists'
end

# view list of lists
get '/lists' do
  @lists = session[:lists]
  erb :lists, layout: :layout
end

# Render the new list form
get '/lists/new' do
  erb :new_list, layout: :layout
end

# Return an error message if the name is invalid. Return nil if name is valid.
def error_for_todo(name)
  if !(1..100).cover? name.size
    'The todo name must be between 1 and 100 characters.'
  end
end

# Return an error message if the name is invalid. Return nil if name is valid.
def error_for_list_name(name)
  if !(1..100).cover? name.size
    'The List name must be between 1 and 100 characters.'
  elsif session[:lists].any? { |list| list[:name] == name }
    'List name must be unique.'
  end
end

# Create a new list
post '/lists' do
  list_name = params[:list_name].strip
  error = error_for_list_name(list_name)

  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    session[:lists] << { name: list_name, todos: [] }
    session[:success] = 'The list has been created.'
    redirect '/lists'
  end
end

# brings up list by the lists index number
get '/lists/:list_number' do
  @list = session[:lists][params[:list_number].to_i]
  erb :list, layout: :layout
end


# Edit an existing todo list
get "/lists/:list_number/editlist" do
  list_number = params[:list_number].to_i
  @list = session[:lists][list_number]
  erb :editlist, layout: :layout
end

#update an existing todo list
post "/lists/:list_number" do
  list_name = params[:list_name].strip
  list_number = params[:list_number].to_i
  @list = session[:lists][list_number]

  error = error_for_list_name(list_name)
  if error

    session[:error] = error
    erb :editlist, layout: :layout
  else
    @list[:name] = list_name
    session[:success] = 'The list has been updated.'
    redirect "/lists/#{list_number}"
  end
end

# delete a list from our list of lists
post "/lists/:list_number/delete" do
  list_number = params[:list_number].to_i
  session[:lists].delete_at(list_number)
  session[:success] = "The list has been deleted."
  redirect "/lists"
end

# Add a new todo to a list
post "/lists/:list_number/todos" do
  list_number = params[:list_number].to_i
  @list = session[:lists][list_number]
  todo_name = params[:todo].strip

  error = error_for_todo(todo_name)
  if error
    session[:error] = error
    erb :list, layout: :layout
  else
    @list[:todos] << { name: params[:todo], completed: false }
    session[:success] = "The todo was added."
    redirect "/lists/#{list_number}"
  end
end

# delete a todo from a list
post "/lists/:list_number/todos/:todo/delete" do
  list_number = params[:list_number].to_i
  @list = session[:lists][list_number]
  @list[:todos].delete_at(params[:todo].to_i)
  session[:success] = "The todo has been deleted."

  redirect "/lists/#{list_number}"
end

# update the status of a todo
post "/lists/:list_number/todos/:todo" do
  list_number = params[:list_number].to_i
  @list = session[:lists][list_number]

  @todo_id = params[:todo].to_i
  is_completed = params[:completed] == "true"
  @list[:todos][@todo_id][:completed] = is_completed

  session[:success] = "The todo has been updated."
  redirect "/lists/#{list_number}"
end

# Mark all todos as complete for a list
post "/lists/:list_number/todos/complete/all" do
  list_number = params[:list_number].to_i
  @list = session[:lists][list_number]

  @list[:todos].each do |todo|
    todo[:completed] = "true"
  end
  session[:success] = "All todos have been completed."
  redirect "/lists/#{list_number}"
end
















