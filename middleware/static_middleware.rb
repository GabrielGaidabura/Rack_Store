class Static
	def initialize (app)
		@app = app
	end

	def read_file (file_name, type)
		begin
			file = File.open("public/" + file_name)
			data = file.read
			file.close
			[200, {'Content-Type' => type}, [data]]
		rescue
			[404, {'Content-Type' => 'text/html'}, ["File #{file_name} not found"]]
		end
	end

	def call(env)
		name = env['PATH_INFO']
    	#p "my path : "+name
    	case name
    	when /(\/\w+)*.css$/
      		read_file(name, "text/css")
      	when /(\/\w+)*.jpg$/
      		read_file(name, "image/jpeg")
      	else
      		@app.call(env)
      	end    		
	end
end