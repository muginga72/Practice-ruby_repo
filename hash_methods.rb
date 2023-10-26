hash = { "item" => "Bread", "quantity" => 1, "brand" => "Treehouse Bread Company" }
puts "Hash: #{hash.inspect}"

puts "hash.length: "
puts hash.length

print "hash.invert: "
puts hash.invert

print "hash.shift: "
puts hash.shift.inspect
print "hash: "
puts hash.inspect

hash["item"] = "Bread"

puts "Hash merging: "
print "Original hash: "
puts hash.inspect

puts "Merged with {'calories' => 100}" #merge method create a new hash
puts hash.merge({'calories' => 100})

print "Original hash: "
puts hash.inspect

puts "Merge with {'item' => 'eggs'}" #if the item exixts it will be overwritten
puts hash.merge({'item' => 'eggs'})