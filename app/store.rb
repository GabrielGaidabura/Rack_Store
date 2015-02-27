require_relative 'products.rb'

class Store
  def call(env)
  	#[200, {"Content-Type" => "text/html"}, ["welcome"]]
  	request = Rack::Request.new(env)
  	req_path = request.path.split('/')[-1]
    if req_path
      products = Products.find(req_path)
      if products
        [200, {"Content-Type" => "text/html"}, [products.to_html]]
      else
        [404, {"Content-Type" => "text/html"}, ["Product not found"]]
      end
    else
      [200, {"Content-Type" => "text/html"}, [Products.to_html]]
    end
  end
end