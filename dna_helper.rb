module DNA_helper
  def three_prime
    "3`"
  end

  def five_prime
    "5`"
  end

  def dash
    ' - '
  end
  
  def dna_base_pair(strand)
    strand.tr!("ATGC35","TACG53")
  end

end
