class UsersController < ApplicationController
  def change_role
    authorize User
    @user = User.find_by(id: params[:id])
    @user.update(role: params[:user][:role])
    redirect_to :back
    flash[:notice]= "Rol cambiado"
  end
end
