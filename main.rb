require './factory'

Customer = Factory.new(:name,:address,:zip)

joe = Customer.new('Joe Smith', '123 Maple, Town NC', 12345)
bob = Customer.new('Joe Smith', '123 Maple, Town NC', 12345)

puts joe.name
puts joe['name']
puts joe[:name]
puts joe[0]

puts joe.eql?(bob)
puts joe['name'] = 'Anton'
puts joe.to_h
puts joe.to_a
puts joe.values_at(0,1)
puts joe.size
joe.each {|x| puts "attr: #{x}"}
puts joe == String
puts joe.eql?(bob)


