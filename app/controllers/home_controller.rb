class HomeController < ApplicationController
	before_action :confirm_logged_in


	def index

		if user_signed_in?
			if current_user.admin?

			else

			end
      evaluations = Evaluation.where(user_id: current_user.id)
      if evaluations.count == 0
        @final_skills = nil
        return @final_skills
      else
      averages = []
      evaluations.each do |evaluation|
        averages << evaluation.get_score
      end
      final_scores = get_final_average(averages)
      @final_skills = {'Buen ambiente':final_scores[0], 'Enseñanza':final_scores[1] ,'Preparación':final_scores[2],'Responsabilidad':final_scores[3]}.sort_by { |skill, score| score }.reverse!
      end

		end


	end
	def change_rol
		if current_user.admin? || current_user.vip? 
			@users = User.all
		else
			redirect_to index_path
		end


	end

	private
	  def get_final_average(scores)
	    liderazgo = 0
	    comunicacion = 0
	    responsabilidad= 0
	    autoridad = 0
	    scores.each do |score|
	      liderazgo += score[0]
	      comunicacion += score[1]
	      responsabilidad += score[2]
	      autoridad += score[3]
	    end
	    quantity = scores.count
	    return [liderazgo/quantity, comunicacion/quantity, responsabilidad/quantity,
	            autoridad/quantity]
	  end

end
