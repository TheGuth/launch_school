def hello
  "hello!"
end

p hello

p hello { puts 'hi' }

def echo(str)
  str
end

# echo                                          # => ArgumentError: wrong number of arguments (0 for 1)
# echo("hello!")                                # => "hello!"
# echo("hello", "world!")                       # => ArgumentError: wrong number of arguments (2 for 1)

# # this time, called with an implicit block
# echo { puts "world" }                         # => ArgumentError: wrong number of arguments (0 for 1)
# echo("hello!") { puts "world" }               # => "hello!"
# echo("hello", "world!") { puts "world" }      # => ArgumentError: wrong number of arguments (2 for 1)

def echo_with_yield(str)
  yield
  str
end

def echo_with_yield(str)
  yield if block_given?
  str
end

def say(words)
  yield if block_given?
  puts "> " + words
end

say("hi there") do
  system ' clear'
end

def increment(number)
  if block_given?
    yield(number + 1)
  else
    number + 1
  end
end

increment(5) do |num|
  puts num
end



































