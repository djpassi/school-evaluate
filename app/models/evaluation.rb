class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  belongs_to :survey_schema

  def get_score
    return 1
    @liderazgo = get_average("Liderazgo")
    return @liderazgo
  end


  def get_average(type)
    sum = 0
    count = 0
    self.answers.each do |answer|
      if (answer.skill == type)
        sum += answer.score
        count +=1
      end
    end

    if (count == 0)
      return 0
    end
    return sum/count
  end
end
