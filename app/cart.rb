require_relative 'controllers/template_controller.rb'

class Cart
	attr_reader :products
	attr_reader :total_price
	
	def initialize
		@products = {}
		@total_price = 0
	end

	def contents
		@products
	end

	def add(product)
		if @products[product]
			@products[product] += 1
		else
			@products[product] = 1
		end
		@total_price += product.price
	end

	def delete(product)
		if @products[product] 

			@total_price -= product.price

			if @products[product] > 1
				@products[product] -= 1
			else
				@products.delete(product)
			end
		end
	end

	def clear_the_cart
		@products = {}
		@total_price = 0
	end

	def total_price
		@total_price
	end

	def to_html
		template = File.dirname(__FILE__)+"/view/cart.html.erb"
		layout = File.dirname(__FILE__)+"/view/layout.html.erb"

		t = TemplateController.new(:products => @products, :total_price => @total_price)
		t.render(template,layout)
	end
end