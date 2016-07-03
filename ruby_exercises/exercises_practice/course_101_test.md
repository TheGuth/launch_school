## James Guthrie Assessment

# Local Variables

### Question 1. 

```ruby
  str = 1

  loop do
    str = 2
    break
  end

  puts str
```

The variable str is initialized to the object or integer 1. a loop or block is called, and the str is reassigned to the object or integer 2. The reason the output of str is 2 is because the str = 1 variable scope is determined by where it is initializsed or created in the program. In Ruby, a variable initialised outside a block is available inside the block, which is the case we have on question 1. Since the variable str is initialized before the loop block, it allows us to reassign the variable to the integer 2, which is why when we call puts on str, it outputs 2.

###  Question 2. 

```ruby
  loop do
    str = 2
    break
  end

  puts str  # str never defined outside the loop do block
```

The following raises a undefined variable error, because str = 2 is initialized within the loop do block. local variable scope doesn't allow us to call puts on str, because it is undefined outside of the loop. If we were to call puts str within the loop we would not have an issue since str is initialized inside the loop and we are calling puts str from within the loop. Likewise if str was defined outside the loop do block we would be able to call puts str.

### Question 3.

```ruby
 # .. lots of code up here omitted

  loop do
    str = 2
    break
  end

  puts str
```

I can't be positive if the code will run or not, because I do not know for sure, whether or not str has been initialized outside of this loop block, allowing us to use it in the block. Furthermore, I can be sure that there may be a method called str as well that may exist. If there is a variable and method both named str, and both are available to be called, then the variable will take prescedent. Without seeing all the code though you can't known whether or not puts str will output 2.

### Question 4.

```ruby
  str = "hello"   # str initialized to object "hello"

  def a_method
    puts str      # str inside method never defined
  end

  a_method        # error undefined variable or method (but its the variable)
```

Methods have their own scoping rules. A Method cannot directly access variables initialized outside of the method. Methods create their own scope that's outside the execution flow of the program. The variable str = "hello" can't be reach within the method. So calling puts str results in an undefined variable error, because we never initialized a variable called str within the scope of the method.

### Question 5.

```ruby
  str = "hello"  # str initialized to object "hello" (local variable scope)

 def a_method
   str = "world" # str initialized to object "world" (method scope)
 end

 a_method        
 puts str        # "hello"
```

the reason this code works, is because we have initialized the variable str to the string "world", or str = "world". The problem with the last example was that we were calling an uninitialized variable inside the method. Methods are outside the normal execution flow of a program, which means that variables initialized outside a method cannot be reached inside the method and vice versa. The output of this program is "hello" and that is, because when we call puts str, we are calling the variable str that is outside the method. The major difference between str = "hello", and str = "world" is that they have different scopes. 

### Question 6.

```ruby
a = "hello"   # a assigned to object "hello"
b = a         # b assigned to a (so b points to object "hello")
a = "hi"      # a reassigned to "hi" (pointed to new object)
a << " world" # a append " world" so a now points to object "hi world"

puts a        # "hi world"
puts b        # "hello"

```

This is a classic example of variables as pointers. we initialize a variable a and point it towards the object "hello", which is a space in memory. We now initialized a variable b and point it towards a, which is pointing towards the object "hello" and at the same space in memory. We now have two variables a and b both pointing to the object "hello" which is the same space in memory. So when we reassign a to "hi" our b variable is still pointing to the space in memory that it was originally pointed towards when it was assigned to a. When a is reassigned to "hi" it is now pointing towards a different object, and new space in memory. So anything done to a will not effect b, since they are not pointing to the same areas of memory anymore. So b stays "hello" while a becomes "hi world".

### Question 7.

```ruby
a = "hello" # "hello"
b = "world" # "world"

c = a       # "hello"
d = b       # "world"
b = a       # "hello"
a = c       # "hello"
```

There are 4 variables and 2 objects. I went through each line and followed where the variable was pointing to. 
We start off with:

a pointed to "hello" (a is one variable, "hello" is one object)
b pointed to "world" (b is one variable, "World" is one object)
c pointes to a (c is one variable, c is pointing to a which points to "hello")
d points to b (d is one variable, d is pointing to b which points to "world")
b points to a (b is just reassigned same variable, a points to "hello" so b now points to "hello")
a points to c (c points to "hello" from being assigned to a earlier, so a still points to "hello")

# Mutating Method Arguments

### Question 1.

The reason the code prints "hello" is because method arguments are scoped at the method level and are not available outside of the method, unless an action is performed on the argument that would 'mutate the caller'. So when we pass greeting as and argument to the method change. 

```ruby
def change(param)
    param + " world" # param + " world" will create a new string and does not
  end                # mutate the argument that has been passed, because + does
                     # not mutate, but creates a new object
  greeting = "hello"
  change(greeting)

  puts greeting
```

it creates a new_string called "helo world", but this new string does not mutate or change our original object. 


### Question 2.

```ruby
  def change(param)
    param << " world"
  end

  greeting = "hello"
  change(greeting)

  puts greeting
```

The major difference in this example and the previous is the operation done on param << " world", which mutates the caller, or changes the object in its place in memory. Where the param + " world" created a new object. Since this example mutates the object in its place in memory, that means when we call puts greeting, greeting has now been changed to "hello world". where as if we were creating a new object like we did in the last example. The object "hello" space in memory isn't being changed.

### Question 3. 

```ruby
def change(param)
    param = "hi"       # initialized variable param and assigned it to the
    param << " world"  # object "hi", and then appended " world" to that
  end                  # new object.

  greeting = "hello"
  change(greeting)

  puts greeting
```

The reason this example prints "hello" is because we are now not mutating the caller. Our argument (greeting) which points to the object "hello" is passed in to our method change and is immediately reassigned to a new object "hi", and that object is mutated to "hi world", leaving our original object "hello" not mutated or changed, which is why when we call puts greeting, we still print "hello"

### Question 4.

```ruby
  def change(param)
    param += "greeting"  # param = param + "greeting" (creates new obj)
    param << "hey"       # param append "hey" (param = "hellogreetinghey")
    param = "hi"         # param reassigned to new object "hi"
    param << " world"    # param appended " world" param = "hi world"
  end

  greeting = "hello"
  change(greeting)

  puts greeting
```
The reason this example prints "hello" is because we are not not mutating the caller. Our argument (greeting) which points to the object "hello" is passed in to our method change and is immediately reassigned to the creation of a new object through param + "greeting" and we know that the + operator creates a new object. So now anything we do in the method is done to the new object leaving our variable greeting and object "hello" unchanged. So when we call puts greeting we see "hello" printed.

# Working with Collections

### Question 1.

Map returns a new array based on the block's return value. Each element is transformed based on the return value.

### Question 2.

Select returns a new array based on the block's return value. If the block evaluates to true, then the element is selected.

### Question 3.

```ruby
[1, 2, 3].map {|n| n + 1}  # [1, 2, 3].map { |n| n + 1 }

[1, 2, 3].map {|n| n += 1} # [1, 2, 3].map { |n| n = n + 1 }
```

The subtle difference between these two lines of code is the way that they are written. Line 3 has in its block n += 1 compared to Line 1 n + 1. for this case there isn't a difference in the output, but if we are just wanting to add 1 the line 1 is what we should use, because n += 1 should only really be used if n is being used again in that same block.

### Question 4.

```ruby
  arr = [1, 2, 3].map do |n|  #
    n > 2                     # n > 2 checks whether or not each item in the
  end                         # array is greater than 2 and returns a boolean

  p arr
```
This example will return an array of booleans because it is checking whether or not each number is > 2 and returning true or false back to the array.

### Question 5.

```ruby
  arr = [1, 2, 3].map do |n|
    n > 2                   # checkes each number if it greater than 2
    puts n                  # last line puts n, so prints each number
  end                       # and returns a nil to the array

  p arr
```
In this example the array returned will be [nil, nil, nil] because puts n, will print out each number, but returns a nil and since that is the last operation of the block, nil is returned for each number in the array.

### Question 6.

```ruby
  arr = [1, 2, 3].select do |n|
    n + 2                       # checkes whether or not each number meets the
  end                           # criteria, which all will, because n + 2
                                # is truthy so all numbers evaluate to true
  p arr                         # and all numbers are returned in the array
```

In this example the array is returned as [1, 2, 3] because they all evaluate to true in n + 2, which means they are all selected and the new array contains [1, 2, 3]. Select method is checking each number to see if it meets the criteria if the number passes the block it gets grabed and put into the new array, but if the block evaluates to false the number isn't selected, the problem with this example is that all numbers will be true, which means they will all be selected, and put into a new array.

### Question 7.

```ruby
  arr = [1, 2, 3].select do |n|
    n + 2
    puts n                     # last line prints the number, and returns nil
  end                          # nil is falsy so no numbers are selected

  p arr
```
In this example an empty array is returned, because the select method evaluates each number to see if they meet the blocks criteria. puts n though returns nil which evaluates the block to false, since nil is falsy. Since every number evaluates to false, that means no numbers are selected and the new array is empty.













