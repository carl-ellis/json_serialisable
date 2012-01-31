require './jserialisable'
require 'json'

class A

	attr_accessor :a, :b, :c
	attr_serialise :a, :b, :c

	def initialize(a, b, c)
		@a, @b, @c = a, b, c
	end

	def to_s
		return a
	end

end


a = A.new(3,5,4)
puts a.to_s
j = a.to_json
puts j
puts JSON.parse(j).to_s
