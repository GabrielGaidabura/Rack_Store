require_relative "spec_helper"
require_relative "../app/orders.rb"
require_relative "../app/cart.rb"
require_relative "../app/products.rb"

describe Orders do 

	before do
    	described_class.purge
  	end

  	let(:product1) { Products.new("name1", "full_name1", "desc1", 111, "img/img1.jpg") } 
  	let(:product2) { Products.new("name2", "full_name2", "desc2", 222, "img/img2.jpg") }
  	let(:cart) {Cart.new}

  	it "generate new id of order" do
  		expect{ described_class.gen_new_id }.to change{Orders.get_last_order_id}.from(0).to(1)
  	end
	
end