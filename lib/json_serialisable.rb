# Mixin for the Class class
class Class
	# A shorthand which automatically adds methods for serialising via JSON
	#
	# Example:
	#					attr_serialise :a, :b, ...
	#
	# Arguments:
	#					(:variable_label)+
	#
	#	Remark: 
	#					There should be a matching contstructor with the same method signature as the labels used in the function call.
	# 				This way json_create will not error when it is called.

	def attr_serialise(*attrs)
    	
		# Sanity checks
		abort "Please provide at least one argument" if attrs.length == 0

		#Build to the to_json method
		tojson = "def to_json(*a)\n{ 'json_class' => #{self.name}"
		attrs.each { |a| tojson << ",\n'#{a}' => @#{a}"}
		tojson << "\n}.to_json(*a)\nend"

		#build to json_create method
		jsoncreate = "def self.json_create(o)\nnew( *o['#{attrs.shift}']"
		attrs.each { |a| jsoncreate << ", *o['#{a}']" }
		jsoncreate << ")\nend"

		# Add methods
		class_eval(tojson)
		class_eval(jsoncreate)
	end
end
