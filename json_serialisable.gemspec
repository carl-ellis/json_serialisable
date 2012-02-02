Gem::Specification.new do |s|
	s.name				= 'json_serialisable'
	s.version			=	'0.0.1'
	s.date				= '2012-02-02'
	s.summary			= "Class mixin for JSON support"
	s.description	= "Adds support for autogenerating json serialisation functions"
	s.authors			=	["Carl Ellis"]
	s.email				=	'carlc75@gmail.com'
	s.files				=	["lib/json_serialisable.rb"]
	s.homepage		=	"http://carlellis.co.uk"
	s.add_dependency('json', '>=1.5.4')
end
