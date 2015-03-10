require_relative "../orders.rb"
require_relative "../cart.rb"

class OrderController
	def initialize(env)
		@env = env
	end

	def order_post

		if @env['create_an_order']
			cart = @env['session']['cart']
			content = Orders.orders_form_to_html(cart)
		elsif @env['complete_an_order']
			content = "Order is complete successfully"
		end
		
		[200, {"Content-Type" => "text/html"}, [content]]
	end

	def order_get
		content = 'You get wrong url-link'
		[200, {"Content-Type" => "text/html"}, [content]]
	end
end