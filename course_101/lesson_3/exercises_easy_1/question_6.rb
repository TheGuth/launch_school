# Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

puts famous_words.insert(0, "Four score and ")

famous_words = "sevenyears ago..."

puts famous_words.prepend("Four score and ")

famous_words = "sevenyears ago..."

"Four score and " + famous_words

famous_words = "sevenyears ago..."

"Four score and " << famous_words
