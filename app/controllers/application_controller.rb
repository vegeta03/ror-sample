class ApplicationController < ActionController::Base
  before_action :authorized

	def auth_header
	   request.headers['Authorization']
	end

	def encode_token(payload)
	    JWT.encode(payload , ApplicationController.secret)
	end
	
	def decoded_token
	  if auth_header
	    token = auth_header.split(' ')[1]
	    begin
	      JWT.decode(token , ApplicationController.secret , true , algorithm: 'HS256')
	   rescue
	      [{user_id: nil}] 
	    end
	  end
	end
	
	def logged_in_user
	  if decoded_token
	    user_id = decoded_token[0]['user_id']
	    user = User.find_by(id: user_id)
	  else
	    authenticate_user!
	    current_user
	  end
	end
	
	def logged_in?
	  !!logged_in_user
	end

	def authorized
	  if params[:controller] == 'devise/registrations'
	    new_user_registration_path  
	  else
	   render json: {msg: 'Please Log In'} , status: :unauthorized unless logged_in?
	  end
	end
	
	private
	
	def self.secret
	    "f0r_a11_7h3_m0n37_7h27_3R_7_h@d"
	end
end