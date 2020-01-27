load "HandValidator.rb"

require 'Set'
require 'test/unit/assertions'

$suits = Array.new(['h', 's', 'c', 'd'])
$ranks = Array.new(['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'])
puts "please enter a group of cards in the form of card,card,card,..."
group = Array.new
user_input=gets.chomp()
group = user_input.split(/,/)

$group_suits=Set.new
$group_ranks=Array.new

# main function
def validgroup(group)
  if(!GeneralValidation(group))
    return false
  end
  if(CheckSequence(group))
    return true
  end
  if(CheckSameRank(group))
    return true
  end
  return false
end

puts validgroup(group)
