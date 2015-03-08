require_relative "spec_helper"
require_relative "../app/cart.rb"
require_relative "../app/products.rb"


describe Cart do

	let(:product1) { Products.new("name1", "full_name1", "desc1", 111, "img/img1.jpg") } 
  	let(:product2) { Products.new("name2", "full_name2", "desc2", 222, "img/img2.jpg") }
  	let(:cart) {Cart.new}
  	
  	it "cart. add(product)" do
  		expect {cart.add(product1)}.to change {cart.contents.size}.from(0).to(1)
  	end

  	it "cart. double add(product1), value must be = 2" do
  		expect {cart.add(product1)}.to change {cart.contents}.from({}).to({product1 => 1})
  		expect {cart.add(product1)}.to change {cart.contents[product1]}.from(1).to(2)
  	end

  	it "cart. delete(product)" do
  		expect {cart.add(product1)}.to change {cart.contents.size}.from(0).to(1)
  		
  		expect {cart.delete(product1)}.to change {cart.contents}.from({product1 => 1}).to({})
  	end

  	it "cart. delete(product1), when pr1 => 2, pr2 =>1, and must be after pr1=>1 pr2=>1" do
  		expect {cart.add(product1)}.to change {cart.contents.size}.from(0).to(1)
  		expect {cart.add(product1)}.to change {cart.contents[product1]}.from(1).to(2)
  		expect {cart.add(product2)}.to change {cart.contents.size}.from(1).to(2)

  		expect {cart.delete(product1)}.to change {cart.contents[product1]}.from(2).to(1)
  		expect(cart.contents.size).to eq(2)
  		expect(cart.contents[product1]).to eq(1)
  	end

  	it "cart. total_price, add 1 product" do
  		expect {cart.add(product1)}.to change {cart.total_price}.from(0).to(111)
  	end

  	it "cart. total_price, when add 2x product1 + 1x product2, and remove 1x product1" do
  		expect {cart.add(product1)}.to change {cart.total_price}.from(0).to(111)
  		expect {cart.add(product1)}.to change {cart.total_price}.from(111).to(222)
  		expect {cart.add(product2)}.to change {cart.total_price}.from(222).to(444)

  		expect {cart.delete(product1)}.to change {cart.total_price}.from(444).to(333)
  	end

  	it "cart. clear_the_cart" do
  		expect {cart.add(product1)}.to change {cart.contents.size}.from(0).to(1)
  		expect {cart.add(product1)}.to change {cart.contents[product1]}.from(1).to(2)
  		expect {cart.add(product2)}.to change {cart.contents.size}.from(1).to(2)
  		expect(cart.contents).to eq({product1=>2, product2=>1})
  		expect(cart.total_price).to eq(444)

  		expect {cart.clear_the_cart}.to change {cart.contents}.from({product1=>2, product2=>1}).to({})
  		expect(cart.total_price).to eq(0)
  	end

end