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

  #Used to complement strands of DNA
  def dna_base_pair
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

end
