load "HandValidator.rb"

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
print '["Ah","1j","Qh"]' + '->'
puts validgroup(["Ah","1j","Qh"])
print '["Ah","2h","3h"]' + '->'
puts validgroup(["Ah","2h","3h"])
