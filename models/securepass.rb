class Securepass
	attr_reader :log

	def initialize(email, password)
		@email = email
		@password = password
		@log
	end


	def isPasswordSecure
		password_length
	end


	def password_length
		if @password.length >= 7
			password_include
		else
			@log = "Password not secure: It must be at least 7 characters"
		end
	end


	def password_include
		parts = []
		parts = @email.split("@")
		parts[1]=parts[1].split(".")
		if (@password.include? parts[0]) || (@password.include? parts[1][0]) || (@password.include? parts[1][1])

			@log = "Password not secure: It contains part of the mail (name, domain)"

		else
			has_number
		end
	end

	def has_number
		if @password =~ /\d/
			has_letters
		else
			@log = "Password insecure: It must contain at least one number"
		end
	end

	def has_letters
		if @password =~/\D/
			has_capital
		else
			@log = "Pasword insecure: It must contain at least one letter"
		end
	end

	def has_capital
		if @password =~ /[A-Z]/
			has_noncapital
		else
			@log = "Password insecure: It must contain at least one capital letter"
		end
	end

	def has_noncapital
		if @password =~ /[a-z]/
			has_symbol
		else
			@log = "Password insecure: It must contain at least one non capital letter."
		end
	end

	def has_symbol
		if (@password =~ /\W/)
			check_1234
		else
			@log = "Pasword insecure: It mus contain at least one symbol"
		end
	end

	def check_1234
		if @password.include? "1234"
			@log = "Password insecure: Only an idiot uses 1234 as a password"
		else
			@log = "Congratulations: Your password is secure"
		end
	end

end