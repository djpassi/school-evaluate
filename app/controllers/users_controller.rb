class UsersController < ApplicationController
  def change_role
    authorize User
    @user = User.find_by(id: params[:id])
    @user.update(role: params[:user][:role])
    redirect_to :back
    flash[:notice]= "Rol cambiado"
  end



  def index;
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
      @final_skills = {'Buen ambiente':final_scores[0], 'Enseñanza':final_scores[1] ,'Preparación':final_scores[2],'Responsabilidad':final_scores[3]}.sort_by { |skill, score| score }.reverse!
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
    buen_ambiente = 0
    enseñanza = 0
    preparacion= 0
    responsabilidad = 0
    scores.each do |score|
      buen_ambiente += score[0]
      enseñanza += score[1]
      preparacion += score[2]
      responsabilidad += score[3]
    end
    quantity = scores.count
    return [buen_ambiente/quantity, enseñanza/quantity, preparacion/quantity,
            responsabilidad/quantity]

  end


end
