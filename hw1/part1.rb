def palindrome?(str)
  cmp_str = str.downcase.gsub(/\W/, '')
  cmp_str == cmp_str.reverse
end

def count_words(str)
  words_count = Hash.new(0)

  str.downcase.split.each_with_object(words_count) do |word, h|
    h[word] += 1
  end
end
