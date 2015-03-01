require_relative 'products.rb'
require_relative 'layout.rb'

class Store
	include Layout

 	def call(env)
  		#[200, {"Content-Type" => "text/html"}, ["welcome"]]
  		request = Rack::Request.new(env)
  		status = 200
  		#raise 34 #make error
  		case request.path 
  		when "/"
  			content = Products.to_html
  		when /^\/(\w+)$/
  			product = Products.find($1)
  			if product
  				content = product.to_html
  			else
  				content = "product not found"
  				status = 404
  			end
  		else
  			content = "page not found"
  			status = 404
  		end

  		[status, {"Content-Type" => "text/html"}, [Layout.layout {content} ]]  			
 	end
end