require_relative "controllers/product_controller.rb"

class Store
    def call(env)
  		request = Rack::Request.new(env)
  		status = 200
  		#raise 34 #make error
  		case request.path 
  		when "/"
            ProductController.new(env).get_products
        when /^\/(\w+)$/
            env['pr_find_name'] = $1
            ProductController.new(env).get_product
  		else
  			ProductController.new(env).no_page
  		end
	
 	end
end