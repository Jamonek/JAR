#!/usr/bin/ruby

##Project:  None
##Author:  Erick Cantwell
##Email:  erick@erickcantwell.com
##Written:  January 2011
##
##This is a very simple method for parsing a Unix style configuration file
##and returning their values in a hash
	
module Config
	def get_vars(conf_file)
		#Here we define a couple of things
		#First is the regular expression that we use to 
		#get rid of whitespace and the array characters.
		line_sub = Regexp.new(/\s+|"|\[|\]/)

		temp = Array.new
		vars=Hash.new

		#Check and make sure that the file exists
		unless File.exists?(conf_file) then
		  raise "The specified configuration file doesn't exist!"	
		end
		IO.foreach(conf_file) do |line|
			#discard comment lines
			if line.match(/^#/)
				next
			elsif
				#discard a blank line
				line.match(/^$/)
				next
			else
				#Snag variable and throw it into the varhash
				temp[0],temp[1] = line.to_s.scan(/^.*$/).to_s.split('=')

				#Match our regular expression and substitute
				temp.collect! do |val|
					val.gsub(line_sub, "")
				end
				#Add the variables to our hash
				vars[temp[0]] = temp[1]
			end
		end
		#And return them
		return vars
	end
end