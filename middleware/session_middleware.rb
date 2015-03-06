require "securerandom"

class Session
	@@session = {}

	def initialize(app)
		@app = app
	end

	def call(env)
		# сделать распознавание по имени
		token = env['HTTP_COOKIE'].split("=").last if env['HTTP_COOKIE']
				
		visit = Time.now

		if ( !token || !@@session[token])
			token = generate_token
			@@session[token] = {"last_visit_time"=>"#{visit}", "visit_counter"=>0}
		end

		@@session[token]["visit_counter"] = @@session[token]["visit_counter"]+1
		@@session[token]["last_visit_time"] = "#{visit}"

		env['session'] = @@session[token]
		status, headers, body = @app.call(env)
		[status, headers.merge({"Set-Cookie"=>"key=#{token}; path=/"}), body]
	end

	private
	def generate_token
		SecureRandom.hex
	end
end