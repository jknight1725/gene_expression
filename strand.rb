require_relative 'dna_helper.rb'

class Strand
include Dna_helper

  attr_reader :prefix, :postfix, :sequence
  def initialize(prefix, sequence)
    @sequence = sequence.upcase
    @prefix   = (prefix == '3' ? three_prime : five_prime)
    @postfix  = (prefix == '3' ? five_prime : three_prime)
    freeze
  end

  def flip
    {
        'A' => 'T',
        'T' => 'A',
        'G' => 'C',
        'C' => 'G',
        '3' => '5',
        '5' => '3',
        "`" => "`",
        "-" => "-",
        " " => " "
    }
  end

  def top_strand
    prefix + dash + sequence + dash + postfix
  end

  def bottom_strand
    postfix + dash + complement + dash + prefix
  end

  def corrected_bottom #mrna needs to read 3-5 -if bottom_strand is in 5-3 reverse
    postfix + dash + complement.reverse + dash + prefix
  end

  def to_s
    top_strand + "\n" + bottom_strand
  end

  def complement
    complement = ''
    sequence.each_char { |c| complement += flip[c] }
    complement
  end

end
