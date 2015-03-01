class Ex_catcher
 	def initialize(app)
    	@app = app
  	end

  	def call(env)
  		begin
  			@app.call(env)
  		rescue Exception => e
  			[500, {"Content-Typ" => "text/html"}, [" Error in application " + e.message]]
  		end
  	end
end