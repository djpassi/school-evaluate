class EvaluationPolicy
    attr_reader :current_user, :evaluation

    def initialize(current_user, evaluation)
      @current_user = current_user
      @evaluation = evaluation

    end

    def evaluate?
      @current_user.UTP?
    end
    def show_evaluation?
      @current_user.UTP?
    end
    def index_evaluations?
      @current_user.UTP?
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
