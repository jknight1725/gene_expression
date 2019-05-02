require_relative 'strand.rb'
require_relative 'dna_helper.rb'

class Transcript_mRNA
include Dna_helper

  attr_reader :strand, :transcript
  def initialize(dna_strand)
    @strand = dna_strand
    @transcript = ''

      #mrna reads dna template strand in the direction 3-5
    if dna_strand.postfix == three_prime
      #template_strand is ready to be transcripted
      strand.bottom_strand.each_char { |c| @transcript += flip[c] }
    else
      #template_strand must be reversed to be read from 3-5
      strand.corrected_bottom.each_char { |c| @transcript += flip[c] }
    end

    freeze
  end

  def flip
    {
        'A' => 'U',
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

  def to_s
    transcript
  end

  def sequence
    transcript[5..transcript.length - 6]
  end

  def translate
    transcript[0,2] == five_prime ? sequence : sequence.reverse
  end

  def amino_acid_sequence
    arr = translate.chars
    amino_sequence = ''
    codon = arr.first(3) * ''

    while (codon != 'AUG') do
      arr.shift
      codon = arr.first(3) * ''
    end

    while(!arr.empty?) do
      codon = arr.first(3) * ''
      if mRna_to_amino_acid[codon]
        amino_sequence += mRna_to_amino_acid[codon] + ' '
      else
        break
      end
      3.times { arr.shift }
    end
    amino_sequence
  end

end


dna = Strand.new('5', "gcgtatggctgggaacgagacctaagcg")
puts "Strand of DNA\n#{dna}\n\n"
puts "Template strand: #{dna.bottom_strand}"

mrna = Transcript_mRNA.new(dna)
puts "mRNA transcript: #{mrna}\n\n"
puts "mRNA translation:     #{mrna.translate}"
puts "Amino Acid Sequence:  #{mrna.amino_acid_sequence}"


