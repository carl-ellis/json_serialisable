require '../jserialisable'
require 'json'

class A
	include Comparable

	attr_accessor :a, :b, :c
	attr_serialise :a, :b, :c

	def initialize(a, b, c)
		@a, @b, @c = a, b, c
	end

	def to_s
		return a
	end

	def <=>(other)
		if (self.a == other.a && self.b == other.b && self.c == other.c)
			return 0
		end
	end

end
