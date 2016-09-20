require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

before do
  @content = File.readlines("data/toc.txt")
end

helpers do
  def in_paragraphs(text)
    text.split("\n\n").map.with_index do |line, index|
      "<p id='#{index}'>#{line}</p>"
    end.join
  end

  def highlight(text, term)
    text.gsub(term, %(<strong>#{term}</strong>))
  end
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  
  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  chapter_name = @content[number - 1]
  @title = "Chapter #{number}: #{chapter_name}"

  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

# Calls the block for each chapter, passing that chapter's number, name, and
# contents.
def each_chapter(&block)
  @content.each_with_index do |name, index|
    number = index + 1
    contents = File.read("data/chp#{number}.txt")
    yield number, name, contents
  end
end

# This method returns an Array of Hashes representing chapters that match the
# specified query. Each Hash contain values for its :name and :number keys.
def chapters_matching(query)
  results = []

  return results unless query

  each_chapter do |number, name, contents|
    results << {number: number, name: name} if contents.include?(query)
  end

  results
end

get "/search" do
  @results = chapters_matching(params[:query])
  erb :search
end


not_found do
  redirect "/"
end








# views/search.erb

# <h2 class="content-subhead">Search</h2>

# <form action="/search" method="get">
#   <input name="query" type="text" value="<%= params[:query] %>"/>
#   <button type="submit">Search</button>
# </form>

# <% if @results.empty? %>
#   <p>Sorry, no matches were found.</p>
# <% else %>
#   <h2 class="content-subhead">Results for '<%= params[:query]%>'</h2>

#   <ul>
#     <% @results.each do |result| %>
#       <li><a href="/chapters/<%= result[:number] %>"><%= result[:name] %></a></li>
#     <% end %>
#   </ul>
# <% end %>



