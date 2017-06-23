class Evaluation < ApplicationRecord
  belongs_to :user
  has_many :answers
  belongs_to :survey_schema
  @title = ""


  def get_best_skills
    scores = get_best_score
    @sort = scores.sort_by { |x| x[0] }
    return [@sort[3],@sort[2]]

  end
  def get_score
    @buen_ambiente = get_average("Buen ambiente")
    @enseñanza = get_average("Enseñanza")
    @preparacion= get_average("Preparación")
    @responsabilidad = get_average("Responsabilidad")
    @respuesta = [@buen_ambiente,@enseñanza,@preparacion,@responsabilidad]
    return @respuesta
  end
  def get_best_score
    @buen_ambiente = get_average("Buen ambiente")
    @enseñanza = get_average("Enseñanza")
    @preparacion= get_average("Preparación")
    @responsabilidad = get_average("Responsabilidad")
    @respuesta = [[@buen_ambiente,"Buen ambiente"],[@enseñanza,"Enseñanza"],[@preparacion,"Preparación"],[@responsabilidad,"Responsabilidad"]]
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
    respuesta = (sum/count).round(2)
    return respuesta
  end

  def get_category_score
    @introduccion = get_average_category(0)
    @desarrollo = get_average_category(1)
    @conclusion = get_average_category(2)
    @respuesta = [@introduccion, @desarrollo,@conclusion]
    return @respuesta
  end

  def get_average_category(type)
    sum = 0
    count = 0
    self.answers.each do |answer|
      if (answer.genre == "score")
        if (answer.category == type)
          sum += Integer(answer.text).to_f
          count +=1
        end
      end
    end

    if (count == 0)
      return 0
    end
    respuesta = sum/count
    @respuesta = respuesta.round(2)
    return @respuesta

  end

  def get_same_evaluations
    @title= SurveySchema.find_by(id:self.survey_schema_id).title
    @same_evaluations = Evaluation.where(survey_schema_id: self.survey_schema_id)
    # puts ("HOSDLSADNKLSAND")
    # puts (@title)
    # puts ("hidsad")
    # puts (@same_evaluations[1].answers[0].name)
    # puts(self.answers[0].name)
    return @same_evaluations
  end

  def get_google_chart(scores)
    data_array_1 =  [1,4,3,5,9]
    data_array_2 = [4,2,10,4,7]
    @barra = Gchart.bar(
    :size => '400x400',
    :bar_colors => ['0000FF'],
    :title => "Resultados Profesor",
    :bg => 'EFEFEF',
    :legend => ['Resultados'],
    :data => [scores],
    :stacked => false,
    :legend_position => 'bottom',
    :axis_with_labels => [['x'], ['y']],
    :max_value => 5,
    :min_value =>0,
    :axis_labels => [["B|E|L|R"]],
    )
    return @barra
  end
  def get_average_of_all(final_scores)
    @score0=0
    @score1=0
    @score2=0
    @score3 =0
    contador = 0

    final_scores.each do |score|
      @score0+=score[0]
      @score1+=score[1]
      @score2+=score[2]
      @score3+=score[3]
      contador +=1
    end
    if (contador == 0)
      return 0
    end
    return [@score0/contador,@score1/contador,@score2/contador,@score3/contador]
  end

  def get_google_chart_line
    @same_evaluations = self.get_same_evaluations
    @final_scores = []
    @scores = []
    @final_names = []

    @categorias = ["Buen ambiente","Enseñanza","Preparación","Responsabilidad"]
    @same_evaluations.each do |evaluation|
      @score = evaluation.get_score
      @name = User.find_by(id:evaluation.user_id).name
      @scores << @score
      @final_names << @name
    end
    @almost_final_scores = get_average_of_all(@scores)
    @contador = 0
    @scores = []
    @almost_final_scores.each do |score_promedio|
      @scores << [@categorias[@contador],score_promedio]
      @contador +=1
    end
    @final_scores << @scores

    @almost_final_scores = self.get_score
    @contador = 0
    @scores = []
    @almost_final_scores.each do |score_user|
      @scores << [@categorias[@contador],score_user]
      @contador +=1
    end
    @final_scores << @scores
    return @final_scores
    return @barra
  end



end
