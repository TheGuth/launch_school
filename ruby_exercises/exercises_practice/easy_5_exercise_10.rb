
# def box_size_space(string)
#   string.size.times { print ' ' }
# end

# def box_size_border(string)
#   string.size.times { print '-' }
# end

# def print_in_box(string)
#   p box_size_space(string)
#   puts "+-#{box_size_border(string)}-+"
#   puts "| #{box_size_space(string)} |"
#   puts "| #{string} |"
#   puts "| #{box_size_space(string)} |"
#   puts "+-#{box_size_border(string)}-+"
# end

def print_in_box(message)
   horizontal_rule = "+#{'-' * (message.size + 2)}+"
   empty_line = "|#{' ' * (message.size + 2)}|"

   puts horizontal_rule
   puts empty_line
   puts "| #{message} |"
   puts empty_line
   puts horizontal_rule
end

print_in_box('')
print_in_box('To boldly go where no one has gone before.')