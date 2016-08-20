# For example, if we count the words for the input "olly olly in come free", we should get:

# olly: 2
# in: 1
# come: 1
# free: 1

class Phrase
  def initialize(words)
    @words = words
  end

  def word_count
    count = Hash.new(0)

    @words.scan(/\b[\w']+\b/) do |word|
      count[word.downcase] += 1
    end

    count
  end
end

# or

class Phrase
  def initialize(phrase)
    @words = phrase.downcase.scan(/[a-z]+'?[a-z]+|\d+/)
  end

  def word_count
    @words.each_with_object(Hash.new(0)) do |word, results|
      results[word] += 1
    end
  end
end