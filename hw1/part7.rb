class CartesianProduct
  def initialize(a, b)
    @value = a.each_with_object([]) { |l, a| b.each { |n| a << [l, n] } }
  end

  def method_missing(meth, *args, &block)
    @value.public_send(meth, *args, &block)
  end
end
