#!/usr/bin/env ruby
require '../jserialisable.rb'
require './test.rb'
require 'test/unit'

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
