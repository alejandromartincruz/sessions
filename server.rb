require "sinatra"
require "sinatra/reloader"
require "pry"

require_relative "./models/checkpass.rb"
require_relative "./models/securepass.rb"

enable (:sessions)
@log = ""
#passwords ={alex: "1234"}

get "/session_test/:text" do
	text = params[:text]
	session[:saved_value] = text
end

get "/" do
	
	erb :init
end

post "/sessions" do
	username = params[:email]
  	password = params[:password]

  	@log = Securepass.new(username, password)
  	#binding.pry
  	@log = @log.isPasswordSecure
  	if @log == "Congratulations: Your password is secure"
		validate = Checkpass.new(params[:email], params[:password]).check

		if validate == true
			session[:user] = params[:email]
			redirect "/profile"
		else

			
			redirect "/"
		end
	else
		
		erb(:init)
		#redirect "/"
	end
end

post "/logout" do
	session.clear
	redirect "/profile"
end

get "/profile" do
	erb :profile
end