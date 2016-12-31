# Monkey patch for Strings
class String
  def jumble
    split('').shuffle.join('')
  end

  def alphabetize
    split('').sort.join('')
  end
end
