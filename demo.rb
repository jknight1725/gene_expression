require_relative 'dna_strand'
require_relative 'dna_helper'
require_relative 'mrna_helper'
require_relative 'mrna_transcript'



dna = DNA_Strand.new('5', "gcgtatggctgggaacgagacctaagcg")
puts "Strand of DNA\n#{dna}\n\n"
puts "Template strand: #{dna.bottom_strand}"

mrna = Transcript_mRNA.new(dna)
puts "mRNA transcript: #{mrna}\n\n"
puts "mRNA translation:     #{mrna.translation}"
puts "Amino Acid Sequence:  #{mrna.amino_acid_sequence}"
