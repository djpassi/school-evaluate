class SurveySchemaPolicy
    attr_reader :current_user, :surveyschema

    def initialize(current_user, surveyschema)
      @current_user = current_user
      @surveyschema = surveyschema

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
