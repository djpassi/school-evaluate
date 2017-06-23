class SurveySchemaPolicy
    attr_reader :current_user, :surveyschema

    def initialize(current_user, surveyschema)
      @current_user = current_user
      @surveyschema = surveyschema

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
  def show?
    current_user.UTP?
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
