require_relative 'dna_strand'
require_relative 'dna_helper'
require_relative 'mrna_helper'

class Transcript_mRNA
include DNA_helper
include MRNA_helper

  attr_reader :transcript
  def initialize(dna_strand)
    @transcript = ''
    #mrna reads dna template strand in the direction 3`- 5`
    (dna_strand.postfix == three_prime) ?
        #strand is properly oriented
        dna_strand.bottom_strand.each_char {|c| @transcript << rna_base_pair[c]} :
        #strand needs to be read in reverse
        dna_strand.corrected_strand.each_char {|c| @transcript << rna_base_pair[c]}
    freeze
  end

  def to_s
    transcript
  end

  def sequence
    transcript[5..transcript.length - 6]
  end

  def translation
    transcript[0,2] == five_prime ? sequence : sequence.reverse
  end

end
