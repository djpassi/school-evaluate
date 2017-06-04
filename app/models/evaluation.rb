class Evaluation < ApplicationRecord
  belongs_to :user
  has_many :answers
  belongs_to :survey_schema

  def get_score
    @liderazgo = get_average("Liderazgo")
    @comunicacion = get_average("Comunicación")
    @responsabilidad= get_average("Responsabilidad")
    @autoridad = get_average("Autoridad")
    @respuesta = [@autoridad,@comunicacion,@liderazgo,@responsabilidad]
    return @respuesta
  end


  def get_average(type)
    sum = 0
    count = 0
    self.answers.each do |answer|
      if (answer.skill == type)
        sum += Integer(answer.text).to_f
        count +=1
      end
    end

    if (count == 0)
      return 0
    end
    respuesta = sum/count
    return sum/count
  end
end
