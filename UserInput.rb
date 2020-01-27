load "HandValidator.rb"

puts "please enter a group of cards in the form of card,card,card,..."
group = Array.new
user_input=gets.chomp()
group = user_input.split(/,/)

puts validgroup(group)
