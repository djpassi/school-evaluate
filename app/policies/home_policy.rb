class HomePolicy
    attr_reader :current_user, :home

    def initialize(current_user, home)
      @current_user = current_user
      @home = home

    end
  def index?
    @current_user.UTP?
  end
end
