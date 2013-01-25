Dessert = Struct.new(:name, :calories) do
  def healthy?
    calories < 200
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor

  def initialize(name, calories, flavor)
    super name, calories
    self.flavor = flavor
  end
  
  def delicious?
    flavor == "black licorice" ? false : super
  end
end
