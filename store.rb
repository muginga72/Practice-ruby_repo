# Tracking the available
module Inventoryable

  def self.included(klass)
    klass.extend(ClassMethods)
    klass.extend(Enumerable)
  end

  # Create and track method
  module ClassMethods
    def create(attributes)
      object = new(attributes)
      instances.push(object)
      return object
    end

    def instances
      @instances ||= [] # no space between || and =
    end

    def each(&block)
      instances.each(&block)
    end

    def report(title, items)
      puts title
      puts "-" * 50
      items.each do |item|
        line = []
        line.push("Item: #{item.attributes[:name]}")
        line.push("Stock: #{item.stock_count}")
        if item.attributes.include?(:size)
          line.push("Size: #{item.attributes[:size]}")
        end
        puts line.join("\t")
      end
      puts "-" * 50
      puts "\n"
    end

    def in_stock_report
      title = "#{self.to_s} In Stock Report"
      reportable = instances.select{ |instance| instance.in_stock? }
      report(title, reportable)
    end

    def out_of_stock_report
      title = "#{self.to_s} Out Stock Report"
      reportable = instances.select{ |instance| !instance.in_stock? }
      report(title, reportable)
    end
  end

  def stock_count
    @stock_count ||= 0 # no space between || and =
  end
  
  def stock_count=(number)
    @stock_count = number
  end
  
  def in_stock?
    stock_count > 0
  end
  
end

module Muginga
  class Shirt
    #extend Inventoryable::ClassMethods
    include Inventoryable
    attr_accessor :attributes
    
    def initialize(attributes)
      @attributes = attributes
    end
  end

  class Pant
    attr_accessor :attributes
    include Inventoryable
    def initialize(attributes)
      @attributes = attributes
    end
  end

  class Accessory
    attr_accessor :attributes
    include Inventoryable
    def initialize(attributes)
      @attributes = attributes
    end
  end
end 

shirt = Muginga::Shirt.create(name: "MTF", size: "L")
shirt.stock_count = 10

shirt = Muginga::Shirt.create(name: "MTF2", size: "L")

shirt = Muginga::Shirt.create(name: "MTF", size: "M")
shirt.stock_count = 9

pant = Muginga::Pant.create(name: "Jeans", size: "M")
pant.stock_count = 2

pant = Muginga::Pant.create(name: "Jeans", size: "S")
pant.stock_count = 4

accessory = Muginga::Accessory.create(name: "Belt", size: "M")
accessory.stock_count = 1

accessory = Muginga::Accessory.create(name: "Belt", size: "L")
accessory.stock_count = 1

accessory = Muginga::Accessory.create(name: "Necklace")
accessory.stock_count = 1

Muginga::Shirt.in_stock_report
Muginga::Pant.in_stock_report
Muginga::Accessory.in_stock_report

Muginga::Shirt.out_of_stock_report