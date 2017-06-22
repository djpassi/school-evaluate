class UsersController < ApplicationController
  def change_role
    authorize User
    @user = User.find_by(id: params[:id])
    @user.update(role: params[:user][:role])
    redirect_to :back
    flash[:notice]= "Rol cambiado"
  end

  def search
      @users = User.search(params[:search])
  end

  def index
      @users = User.where(role:'user')
  end

  def show;
      @user = User.find(params[:id])
      evaluations = Evaluation.where(user_id: params[:id])
      if evaluations.count == 0
        @final_skills = nil
        return @final_skills
      else
      averages = []
      evaluations.each do |evaluation|
        averages << evaluation.get_score
      end
      final_scores = get_final_average(averages)
      @final_skills = {'Liderazgo':final_scores[0], 'Comunicacion':final_scores[1] ,'Responsabilidad':final_scores[2],'Autoridad':final_scores[3]}.sort_by { |skill, score| score }.reverse!
      end
  end

  private
  def set_user
   @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email)
  end

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
