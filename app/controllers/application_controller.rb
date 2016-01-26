class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  	def after_sign_out_path_for(users)
    	"http://localhost:3000/home"
  	end
    def after_sign_out_path_for(admins)
      "http://localhost:3000/home"
    end
    def after_sign_in_path_for(users)
      "http://localhost:3000/home"
    end
    def after_sign_in_path_for(admins)
      "http://localhost:3000/home"
    end
end
