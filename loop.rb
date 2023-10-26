#The repeat method should take a string, and print it a specified number of times. 
#Use loop and break to complete the method. Be sure to do the following: 
#After printing the value of string, add 1 to the counter variable. 
#Use an if statement together with the break keyword to break out of the loop once counter is equal to times.

def repeat(string, times)
  fail "times must be 1 or more"
  if times < 1
    counter = 0
    loop do
      puts string
        counter += 1
        breack if counter == times
    end
  end
end