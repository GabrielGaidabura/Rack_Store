require_relative "../products.rb"

class ProductController

	def initialize(env)
		@env = env
	end

	def get_product
		product = Products.find(@env['pr_find_name'])    
  			if product
  				content = product.to_html
                status = 200
  			else
  				content = "product not found"
  				status = 404
  			end
        [status, {"Content-Type" => "text/html"}, [content]]
	end

	def get_products
		content = Products.to_html   
        [200, {"Content-Type" => "text/html"}, [content]]
	end

	def no_page
		content = "page not found"
  		status = 404
        [status, {"Content-Type" => "text/html"}, [content]]
	end
end