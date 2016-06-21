


# joinor([1, 2, 3])                # => "1, 2, or 3"
# joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
# joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

arr = [1, 2, 3, 4, 5]
arr2 = [1]
arr3 = [1, 2]

def joinor(array, delimiter = ', ', word = 'or')
  if array.length() - 1 > 0
    array.join(delimiter).insert(-2, word + ' ')
  else
    array.join('')
  end
end

p joinor(arr)
p joinor(arr2)
p joinor(arr3)