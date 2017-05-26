class HomePolicy
    attr_reader :user

    def initialize(user)
      @current_user = user

    end
  def index?
    @current_user.admin?
  end
end
