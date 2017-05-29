class EvaluationPolicy
    attr_reader :current_user, :evaluation

    def initialize(current_user, evaluation)
      @current_user = current_user
      @evaluation = evaluation

    end

    def evaluate?
      @current_user.vip?
    end
    def show_evaluation?
      @current_user.vip?
    end
    def index_evaluations?
      @current_user.vip?
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
