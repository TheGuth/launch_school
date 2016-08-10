# Sleep Alert

# In the code below, status is randomly assigned as 'awake' or 'tired'.

status = ['awake', 'tired'].sample

# Write an if statement that returns "Be productive!" if status equals 'awake' and 
# returns "Go to sleep!" otherwise. Then, assign the return value of the if statement
# to a variable and print that variable.

if status == 'awake'
  message = "Be productive!"
else
  message = "Go to sleep!"
end

puts message