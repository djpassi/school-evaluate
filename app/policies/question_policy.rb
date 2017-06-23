class QuestionPolicy
    attr_reader :current_user, :question

    def initialize(current_user, question)
      @current_user = current_user
      @question = question

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
