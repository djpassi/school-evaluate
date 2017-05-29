class QuestionPolicy
    attr_reader :current_user, :question

    def initialize(current_user, question)
      @current_user = current_user
      @question = question

    end
  def index?
    @current_user.vip?
  end
  def new?
    @current_user.vip?
  end
  def edit?
    @current_user.vip?
  end
  def create?
    @current_user.vip?
  end
  def update?
    @current_user.vip?
  end
  def destroy?
    @current_user.vip?
  end
end
