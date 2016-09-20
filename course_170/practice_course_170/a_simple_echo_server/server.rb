require "socket"

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/

  puts request_line
  client.puts request_line

  client.puts "HTTP/1.0 200 OK"
  client.puts "ContentType: text/html"
  client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"

  client.puts "</pre>"
  client.ptus "</body>"
  client.puts "</html>"

  method, query_params, protocol = request_line.split(' ')
  path, query_params = query_params.split('?')

  params = query_params.split('&').each_with_object({}) do |pair, hash|
    key, value = pair.split("=")
    hash[key] = value
  end

  rolls, sides = query_params.split('&')
  rolls = rolls.split('=')
  sides = sides.split('=')
  client.puts method
  client.puts path
  params = {rolls[0] => rolls[1], sides[0] => sides[1]}
  client.puts params
  client.puts protocol

  params["rolls"].to_i.times do |number|
    client.puts rand(params["sides"].to_i) + 1
  end

  client.close
end