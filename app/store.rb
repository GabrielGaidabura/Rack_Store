require_relative "controllers/product_controller.rb"
require_relative "controllers/cart_controller.rb"

class Store
    def call(env)
  		request = Rack::Request.new(env)
  		status = 200
  		#raise 34 #make error
  		case request.path 
  		when "/"
            env['controller'] = ProductController
            env['action'] = :get_products
        when /^\/(\w+)$/
            env['pr_find_name'] = $1
            env['controller'] = ProductController
            env['action'] = :get_product
        when "/cart"
            env['controller'] = CartController
            if request.post?
                env['add_product'] = request.params['add_pr_name']
                env['delete_product'] = request.params['del_pr_name']
                env['clear_the_cart'] = request.params['clear']
                env['action'] = :cart_post
            else
                env['action'] = :cart_get
            end
        else
            env['controller'] = ProductController
            env['action'] = :no_page
  		end

      env['controller'].new(env).send(env['action'])	
      #env['ProductController'].new(env).call(env) 
 	end
end