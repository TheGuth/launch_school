# Write a program that uses the Sieve of Eratosthenes to find all the primes from 2 
# up to a given number.

# The Sieve of Eratosthenes is a simple, ancient algorithm for finding all 
# prime numbers up to any given limit. It does so by iteratively marking as
# composite (i.e. not prime) the multiples of each prime, starting with the 
# multiples of 2.

# Create your range, starting at two and continuing up to and including the given 
# limit. (i.e. [2, limit]).

# The algorithm consists of repeating the following over and over:

# take the next available unmarked number in your list (it is prime)
# mark all the multiples of that number (they are not prime)

# Repeat until you have processed each number in your range. When the
# algorithm terminates, all the numbers in the list that have not been marked
# are prime. The wikipedia article has a useful graphic that explains the algorithm.

# Notice that this is a very specific algorithm, and the tests don't check that 
# you've implemented the algorithm, only that you've come up with the correct 
# list of primes.

class Sieve
  attr_reader :range

  def initialize(max_count)
    @range = (2..max_count).to_a # creates and array starting with 2 upto max_count
  end

  def primes
    range.each do |prime| # iterates through the array looking at each number.
      range.reject! { |num| (num != prime) && (num % prime == 0)}
    end # num != prime (number not a prime) number divided by all numbers in array 
                # (if any of them has a remainder of 0 means number is not a prime)
  end # reject deletes any value that evaluates to true.
end

p Sieve.new(10).primes