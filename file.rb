File.open("example.txt", "a+") do |file|
  print "Enter your name: "
  name = gets.chomp
  file.puts "name: #{name}"

  print "Enter your email: "
  email = gets.chomp
  file.puts "Email: #{email}"
end