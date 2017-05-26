class HomeController < ApplicationController
	before_action :confirm_logged_in


	def index
		if user_signed_in?
			if current_user.admin?

			else
				
			end

		end



	end

end
