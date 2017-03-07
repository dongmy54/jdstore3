class WelcomeController < ApplicationController
	protect_from_forgery prepend: true
def index
	# flash[:notice] = "早安！你好！ "
end
end
