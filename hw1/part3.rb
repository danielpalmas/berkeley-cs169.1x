def ordered_letters(str)
  str.downcase.each_char.sort.join
end

def combine_anagrams(words)
  hash = Hash.new { |h, k| h[k] = [] }
  
  words.each_with_object(hash) { |word, h|
    h[ordered_letters word] << word
  }.values
end
