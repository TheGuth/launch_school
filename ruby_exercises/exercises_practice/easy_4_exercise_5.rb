# Multiples of 3 and 5

def multisum(number)
  sum = 0
  (1..number).each do |iteration|
    if iteration % 3 == 0 || iteration % 5 == 0
      sum += iteration
    end
  end
    p sum
end


multisum(3)
multisum(5)
multisum(10)
multisum(1000)