def create_list
  print "What is the list name? "
  name = gets.chomp

  hash = { "name" => name, "items" => Array.new }
  return hash
end

#creating method to add items
def add_list_item
  print "What is the item called? "
  item_name = gets.chomp

  # call for quantity
  print "How much? "
  quantity = gets.chomp.to_i

  # will create a hash for the items
  hash = { "name" => item_name, "quantity" => quantity}
  return hash
end

# create method to print separator
def print_separator(character="-")
  puts character * 80
end

# create a new method to print the list items
def print_list(list)
  puts "List: #{list['name']}" # to access the value we use interpolation
  print_separator()

  # put on the list each item ans assign it to a variable
  list["items"].each do |item|
    puts "\tItem: " + item[ 'name'] + "\t\t\t" +
          "Quantity: " + item[ 'quantity'].to_s # convert to string
  end
  print_separator()
end

#Calling the method
list = create_list()

puts "Great! Add some items to your list."

# to write the items into hash
list['items'].push(add_list_item())
list['items'].push(add_list_item())
list['items'].push(add_list_item())

puts "Here's your list:\n"

print_list(list)