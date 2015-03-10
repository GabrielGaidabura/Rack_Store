require_relative "spec_helper"
require_relative "../app/products.rb"

describe Products do

	before do
    	described_class.purge
  	end

  	let(:product1) { described_class.new("name1", "full_name1", "desc1", 111, "img/img1.jpg") } 
  	let(:product2) { described_class.new("name2", "full_name2", "desc2", 222, "img/img2.jpg") }
  	# альтернатива - subject

    it "save product" do
        expect { product1.save }.to change {described_class.all}.from([]).to([product1])
    end

  	it "counts product" do
    	expect { product1.save }.to change { Products.count }.from(0).to(1)
  	end

  	it "all product" do
    	expect { product1.save }.to change { Products.all }.from([]).to([product1])
    	expect { product2.save }.to change { described_class.all }.from([product1]).to([product1, product2])
  	end

    it "purge product" do
        expect { product1.save }.to change {described_class.all}.from([]).to([product1])
        expect { described_class.purge }.to change {described_class.all}.from([product1]).to([])
    end

  	it "find product" do
    	expect { product1.save }.to change { described_class.find("name1") }.from(nil).to(product1)
  	end
end