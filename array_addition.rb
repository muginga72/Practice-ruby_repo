grocery_list = ["milk", "eggs", "bread"]
#methods to add items in an array
grocery_list << "carrots" #will append
grocery_list.push("patatoes")
grocery_list.unshift("celery") #add to the begining of the list
grocery_list += ["ice cream", "pie"]
grocery_list << 1

puts grocery_list.inspect