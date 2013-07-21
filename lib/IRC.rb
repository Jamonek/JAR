#!/usr/bin/ruby

## Jamone A. Kelly
# An IRC robot for practical use
# Beta development for practice of ruby
# Contact: xg.monie089@gmail.com
##
require "socket"

class IRC
	def initialize
		## Get server configuration
		include Config
	
		get_vars('../JAR.conf').each do |key, value|
		@key = @value
	end
end
