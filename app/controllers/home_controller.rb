class HomeController < ApplicationController

  def index
	if current_user.present?
      redirect_to dashboard_index_path	
	end	
  end
end
