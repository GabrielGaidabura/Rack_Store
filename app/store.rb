require_relative "controllers/product_controller.rb"
require_relative "controllers/cart_controller.rb"
require_relative "controllers/order_controller.rb"

class Store
    def call(env)
  		request = Rack::Request.new(env)
  		status = 200
  		#raise 34 #make error
        case request.path 
  		when "/"
            env['controller'] = ProductController
            env['action'] = :get_products
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
        when "/order"
            env['controller'] = OrderController
            if request.post?
                env['create_an_order'] = request.params['create_an_order']
                env['complete_an_order'] = request.params['complete_an_order']
                env['action'] = :order_post
            else
                env['action'] = :order_get
            end
        when /^\/(\w+)$/
            env['pr_find_name'] = $1
            env['controller'] = ProductController
            env['action'] = :get_product
        else
            env['controller'] = ProductController
            env['action'] = :no_page
  		end

      env['controller'].new(env).send(env['action'])	
      #env['ProductController'].new(env).call(env) 
 	end
end