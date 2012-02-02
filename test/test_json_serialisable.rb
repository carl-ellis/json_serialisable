#!/usr/bin/env ruby
require './lib/json_serialisable.rb'
require 'test/unit'
require 'json'

class TestJSerialisable < Test::Unit::TestCase

	# Make sure there is a class and a JSON string to play with
	def setup
		@class = A.new(1, 2, 3)
		@json = '{"json_class":"A","a":1,"b":2,"c":3}'
	end

	def teardown
	end

	# Make sure the object encodes to json correctly JSON
	def test_to_json
		assert_equal(@json, @class.to_json)
	end

	# Make sure the JSON is parse to an object correctly
	def test_json_create
		assert_equal(@class, JSON.parse(@json))
	end


end

# Test class for serialisation
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

