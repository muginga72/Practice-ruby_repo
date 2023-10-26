# I want to create a widgets store features: display welcome, ask for quantity, calculate total and apply discount for large orders
def ask(question)
  print question + ""
  gets.chomp # this method fix the output
end
def price(quantity)
  if quantity >= 100
    price_per_unit = 8
  elsif quantity >= 50
    price_per_unit = 9
  else
    price_per_unit = 10
  end
  quantity * price_per_unit
end

puts "Welcome to the widget store"
answer = ask("How many widgets are you ordering? ")
number = answer.to_i
total = price(number)
puts "For #{number} widgets, your total is: $#{total}"