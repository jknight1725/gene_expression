require_relative 'dna_helper'

class DNA_Strand
include DNA_helper

  attr_reader :prefix, :postfix, :sequence
  def initialize(direction, sequence)
    @sequence = sequence.upcase
    @prefix   = (direction == '3' ? three_prime : five_prime)
    @postfix  = (direction == '3' ? five_prime : three_prime)
    freeze
  end

  def top_strand
    prefix + dash << sequence << dash + postfix
  end

  def bottom_strand
    postfix + dash << complement << dash + prefix
  end

  def corrected_strand
    postfix + dash << complement.reverse << dash + prefix
  end

  def to_s
    top_strand << "\n" << bottom_strand
  end

  def complement
    complement = ''
    sequence.each_char { |c| complement << dna_base_pair[c] }
    complement
  end

end
