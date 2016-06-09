# In another example we used some built-in string methods to change the case 
# of a string. A notably missing method is something provided in Rails, 
# but not in Ruby itself...titleize! This method in Ruby on Rails creates a 
# string that has each word capitalized as it would be in a title.

# Write your own version of the rails titleize implementation.

my_sentence = "this is my sentence yay"

def titleize(sentence)
  new_sentence = []
  new_sentence = sentence.split(' ')
  new_sentence.each { |num| num.capitalize! }
  new_sentence = new_sentence.join(' ')
  puts new_sentence
end

titleize(my_sentence)

# or

words = "wow this is crazy"

puts words.split.map { |word| word.capitalize }.join(' ')   
