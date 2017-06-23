class UserPolicy
    attr_reader :current_user, :user

    def initialize(current_user, user)
      @current_user = current_user
      @user = user

    end
    def change_role?
      @current_user.admin?
    end
  def index?
    @current_user.UTP?
  end
  def new?
    @current_user.UTP?
  end
  def edit?
    @current_user.UTP?
  end
  def create?
    @current_user.UTP?
  end
  def update?
    @current_user.UTP?
  end
  def destroy?
    @current_user.UTP?
  end
end
