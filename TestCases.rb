load "HandValidator.rb"

require 'Set'
require 'test/unit/assertions'

$suits = Array.new(['h', 's', 'c', 'd'])
$ranks = Array.new(['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'])

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

puts "Example Runs"
print '["3h","1j","3c"]' + '->'
puts validgroup(["3h","1j","3c"])
print '["3h","1j","3h"]' + '->'
puts validgroup(["3h","1j","3h"])
print '["2h","3h"]' + '->'
puts validgroup(["2h","3h"])
print '["3h","3c","3s"]' + '->'
puts validgroup(["3h","3c","3s"])
print '["5h","5d","5d","5s"]' + '->'
puts validgroup(["5h","5d","5d","5s"])
print '["5h","5c","5d","5s","5c"]' + '->'
puts validgroup(["5h","5c","5d","5s","5c"])
print '["Qd","Kd","Ad"]' + '->'
puts validgroup(["Qd","Kd","Ad"])
print '["5h","7h","8h"]' + '->'
puts validgroup(["5h","7h","8h"])
