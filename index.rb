require_relative './calculator.rb'

input = ARGV
fn = input[0]
num1 = input[1].to_i
num2 = input[2].to_i

if fn == "add"
  puts Calculator.add(num1, num2)
elsif fn == 'subtract'
  puts Calculator.subtract(num1, num2)
else
  raise 'Unknown action'
end

# puts "What do you want to do?"
# fn = gets.chomp
# if fn != "add" && fn != "subtract" 
#   raise 'Unknown action'
# end
# puts "Enter first number"
# num1 = gets.chomp.to_i
# puts "Enter second number"
# num2 = gets.chomp.to_i

# puts "Answer:"
# if fn == "add"
#   puts Calculator.add(num1, num2)
# elsif fn == 'subtract'
#   puts Calculator.subtract(num1, num2)
# end