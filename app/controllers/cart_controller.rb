require_relative "../cart.rb"
require_relative "../products.rb"

class CartController
	def initialize(env)
		@env = env
	end

	def cart_post
		unless @env['session']['cart']
			@env['session']<<{'cart'=>Cart.new}
		end
		cart = @env['session']['cart']

		if @env['add_product']
			cart.add(Products.find(@env['add_product']))
		elsif @env['delete_product']
			cart.delete(Products.find(@env['add_product']))
		elsif @env['clear_the_cart']
			cart.clear_the_cart
		end
		content = cart.to_html

		[200, {"Content-Type" => "text/html"}, [content]]		
	end

	def cart_get
		unless @env['session']['cart']
			@env['session']<<{'cart'=>Cart.new}
		end
		cart = @env['session']['cart']

		content = cart.to_html
		[200, {"Content-Type" => "text/html"}, [content]]
	end
end