# creating struct it is convenient class

Customer = Struct.new(:name, :email) do

  def name_with_email
    "#{name} <#{email}>"
  end
end

customer = Customer.new("Eli", "elijames@gmail.com")
#puts customer.inspect
#puts customer.name_with_email

customer.each_pair do |name, value|
  puts "#{name} - #{value}"
end