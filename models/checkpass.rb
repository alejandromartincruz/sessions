class Checkpass


	def initialize(username, password)
		@username = username
		@password = password
		@passwords = ["email@domain.com", "Abc123Abc??"]
		@validate = false

	end

	def check
			if @passwords[0] == @username && @passwords[1] == @password
				@validate = true
			else 
				@validate = false
			end

		
	end

end