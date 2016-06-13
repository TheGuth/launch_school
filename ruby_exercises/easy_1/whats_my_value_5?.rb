a = "Xyzzy"

def my_value(b)
  b = 'yzzyX' # sets 'yzzyX' to the argument that was passed in, but doesn't
end           # modifiy the string passed in.

my_value(a) # returns 'yzzyX'
puts a # a = 'Xyzzy'