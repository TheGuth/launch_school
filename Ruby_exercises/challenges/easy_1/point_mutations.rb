# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^

# The Hamming distance between these two DNA strands is 7.

require 'pry'

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    strand1 = @strand.chars
    strand2 = other_strand.chars
    compare_strands = strand1.zip(strand2)
    current_iteration = 0
    count = 0
    loop do
      compare_strands.each do |item|
        break if current_iteration >= strand2.size
        count += 1 if item[0] != item[1]
        current_iteration += 1
      end
      break
    end
    count
  end
end

p DNA.new('GGACTGA').hamming_distance('GGACTGA')
p DNA.new('ACT').hamming_distance('GGA')