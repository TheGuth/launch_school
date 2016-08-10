# Walkthrough: Build a 'each' method

def each(array)
  counter = 0
  while conunter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end