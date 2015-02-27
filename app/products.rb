class Products
  
  @@products = []

  attr_reader :name
  attr_reader :price
  #attr_reader :img

  def initialize(name, price)
    @name = name
    @price = price
    #@img = img
  end

  def save
    @@products << self
    self
  end

  def self.count
    @@products.size
  end

  def self.all
    @@products
  end

  def self.purge
    @@products = []
  end

  def self.find (name)
    @@products.detect { |e| e.name == name }
  end

  def self.to_html
    @@products.reduce('') { |list, e| list + e.to_html }
  end

  def to_html
    "<p><a href='http://localhost:8080/#{self.name}'>#{self.name}:   #{self.price}  </p>"
  end
  
end

Products.new("item1", 200).save
Products.new("item2", 350).save
Products.new("item3", 175).save
Products.new("item4", 410).save
