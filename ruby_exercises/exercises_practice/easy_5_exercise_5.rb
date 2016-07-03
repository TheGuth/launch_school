# Clean up the words

def cleanup(string)
  p new_string_array = string.split(" ")
  new_string_array.each do |word|
    word.gsub!(/[^0-9A-Za-z]/, '')
    if word == ""
      new_string_array.delete(word)
    end
  end
  p new_string_array.join(' ')
end

p cleanup("---what's my +*& line?")

def cleanup2(text)
  text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

p cleanup2("---what's my +*& line?")