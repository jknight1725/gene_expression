module Dna_helper
  def three_prime
    "3`"
  end

  def five_prime
    "5`"
  end

  def dash
    ' - '
  end

  def mRna_to_amino_acid
    {
        'UUU' => 'Phe',
        'UUC' => 'Phe',
        'UUA' => 'Leu',
        'UUG' => 'Leu',

        'UCU' => 'Ser',
        'UCC' => 'Ser',
        'UCA' => 'Ser',
        'UCG' => 'Ser',

        'UAU' => 'Tyr',
        'UAC' => 'Tyr',
        'UAA' =>  nil ,
        'UAG' =>  nil ,

        'UGU' => 'Cys',
        'UGC' => 'Cys',
        'UGA' =>  nil ,
        'UGG' => 'Trp',
        #END U

        #BEGIN C
        'CUU' => 'Leu',
        'CUC' => 'Leu',
        'CUA' => 'Leu',
        'CUG' => 'Leu',

        'CCU' => 'Pro',
        'CCC' => 'Pro',
        'CCA' => 'Pro',
        'CCG' => 'Pro',

        'CAU' => 'His',
        'CAC' => 'His',
        'CAA' => 'Gin',
        'CAG' => 'Gin',

        'CGU' => 'Arg',
        'CGC' => 'Arg',
        'CGA' => 'Arg',
        'CGG' => 'Arg',
        #END C

        #BEGIN A
        'AUU' => 'Ile',
        'AUC' => 'Ile',
        'AUA' => 'Ile',
        'AUG' => 'Met',

        'ACU' => 'Thr',
        'ACC' => 'Thr',
        'ACA' => 'Thr',
        'ACG' => 'Thr',

        'AAU' => 'Asn',
        'AAC' => 'Asn',
        'AAA' => 'Lys',
        'AAG' => 'Lys',

        'AGU' => 'Ser',
        'AGC' => 'Ser',
        'AGA' => 'Arg',
        'AGG' => 'Arg',
        #END A

        #Begin G
        'GUU' => 'Val',
        'GUC' => 'Val',
        'GUA' => 'Val',
        'GUG' => 'Val',

        'GCU' => 'Ala',
        'GCC' => 'Ala',
        'GCA' => 'Ala',
        'GCG' => 'Ala',

        'GAU' => 'Asp',
        'GAC' => 'Asp',
        'GAA' => 'Glu',
        'GAG' => 'Glu',

        'GGU' => 'Gly',
        'GGC' => 'Gly',
        'GGA' => 'Gly',
        'GGG' => 'Gly'
    }
  end

  def amino_acid_to_mRna
    mRna_to_amino_acid.invert
  end

end
