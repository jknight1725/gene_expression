module MRNA_helper

  def start_codon
    'AUG'
  end

  def rna_base_pair(strand)
    strand.tr!("ATGC35","UACG53")
  end

  #benchmark n = 1,000,000
  # 4.548660   0.078037   4.626697 (  4.629168)
  def amino_acid_sequence
    arr = translation.chars
    amino_sequence = ''
    #codon = arr[0,3].join
    codon = arr.first(3).join
    while codon != start_codon do
      arr.shift
      codon = arr.first(3).join
    end

    #TODO: benchmark with each_cons insteard of arr.first(3).join I expect this will have a noticable speed increase
    while(!arr.empty?) do
      codon = arr.first(3).join
      if mRna_to_amino_acid[codon]
        amino_sequence << mRna_to_amino_acid[codon] << ' '
      else
        break
      end
      3.times { arr.shift }
    end
    amino_sequence
  end

  #used to translate mRNA transcripts into amino acid sequences
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
