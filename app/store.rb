require_relative "controllers/product_controller.rb"

class Store
    def call(env)
  		request = Rack::Request.new(env)
  		status = 200
  		#raise 34 #make error
  		case request.path 
  		when "/"
            env['ProductController'] = ProductController
            env['action'] = :get_products
        when /^\/(\w+)$/
            env['pr_find_name'] = $1
            env['ProductController'] = ProductController
            env['action'] = :get_product
        else
            env['ProductController'] = ProductController
            env['action'] = :no_page
  		end

      env['ProductController'].new(env).send(env['action'])	
      #env['ProductController'].new(env).call(env) 
 	end
end