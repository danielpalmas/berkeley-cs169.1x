class Numeric
  @@currencies = {
    'dollar' => 1,
    'yen'    => 0.013,
    'euro'   => 1.292,
    'rupee'  => 0.019
  }

  def in(currency_name)
    singular_currency = currency_name.to_s.gsub(/s$/, '')
    self / @@currencies[singular_currency]
  end

  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub(/s$/, '')

    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
end

class String
  def palindrome?
    downcase.gsub(/\W/, '').each_char.to_a.palindrome?
  end
end

module Enumerable
  def palindrome?
    to_a == to_a.reverse
  end
end
