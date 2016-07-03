  arr = [1, 2, 3].select do |n|
    n + 2
    puts n
  end

  p arr