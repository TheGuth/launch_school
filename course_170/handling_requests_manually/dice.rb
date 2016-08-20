require "socket"

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line
 
  params_hash = {}

  http_method, path_and_params, protocol = request_line.split
  path, params = path_and_params.split("?")

  params.split("&").each do |param|
    key, value = param.split("=")
    params_hash[key] = value
  end
    
  rolls = params_hash["rolls"].to_i
  sides = params_hash["sides"].to_i

  client.puts "HTTP/1.0 200 OK"
  client.puts "Content-Type: text/html"
  client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"

  client.puts request_line
  client.puts http_method
  client.puts path
  client.puts params_hash
  client.puts protocol

  client.puts "<h1>Rolls!</h1>"
  client.puts "</pre>"

  rolls.times do
    client.puts "<p>",rand(sides) + 1,"</p>"
  end
client.puts "</body>"
client.puts "</html>"
  client.close
end