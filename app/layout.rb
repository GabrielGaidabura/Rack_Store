require "erb"

module Layout
	def self.layout
		content = "<!DOCTYPE HTML> \n"
    	content << "<html> \n"
   		content << "<head> \n"
   		content << "<meta charset=\"utf-8\">"
    	content << "<title>R.o.R. Store</title> \n"
    	content << "<link rel='stylesheet' type='text/css' href='styles/my_css.css'> \n"
    	content << "</head> \n"
    	content << "<body> \n"
    	content << yield
    	content << "</body> \n"
    	content << "</html> \n"
	end

	def self.render (layout, template, context)
		ERB.new(File.read(layout)).result(context.get_binding do 
			ERB.new(File.read(template)).result(context.get_binding)			
		end)
	end
end