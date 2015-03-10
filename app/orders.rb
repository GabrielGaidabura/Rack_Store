require_relative 'controllers/template_controller.rb'
require_relative 'cart.rb'

class Orders
	@@orders = []
	@@last_order_id = 0

	attr_reader :order_id
	attr_reader :name
	attr_reader :email
	attr_reader :phone
	attr_reader :products_list

	def initialize(order_id, name, email, phone, products_list)
		@order_id, @name, @email, @phone, @products_list = order_id, name, email, phone, products_list
	end

	def save
		@@orders << self
		self
	end

	def self.purge
		@@orders = []
		@@last_order_id = 0
	end

	def self.find(id)
		@@orders.detect {|order| order.order_id == id}
	end

	def self.gen_new_id
		@@last_order_id += 1
	end

	def self.get_last_order_id
		@@last_order_id
	end

	def self.orders_form_to_html(cart)
		template = File.dirname(__FILE__)+"/view/order.html.erb"
		layout = File.dirname(__FILE__)+"/view/layout.html.erb"
		id = Orders.gen_new_id
		products = cart.contents
		
		t = TemplateController.new(:products => products, :order_id => id)
		t.render(template, layout)
	end
end
