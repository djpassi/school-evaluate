class UsersController < ApplicationController
  def change_role
    authorize User
    @user = User.find_by(id: params[:id])
    @user.update(role: params[:user][:role])
    redirect_to :back
    flash[:notice]= "Rol cambiado"
  end

  def show;
    @user = User.find(params[:id])
  end

  private
  def set_user
   @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
