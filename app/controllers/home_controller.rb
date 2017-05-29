class HomeController < ApplicationController
	before_action :confirm_logged_in


	def index
		if user_signed_in?
			if current_user.admin?

			else

			end

		end

	end
	def change_rol
		if current_user.admin?
			@users = User.all
		else
			redirect_to index_path
		end


	end

end
