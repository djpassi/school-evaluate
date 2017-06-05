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


  def get_same_evaluations
    @title= SurveySchema.find_by(id:self.survey_schema_id).title
    @same_evaluations = Evaluation.where(survey_schema_id: self.survey_schema_id)
    puts ("HOSDLSADNKLSAND")
    puts (@title)
    puts ("hidsad")
    puts (@same_evaluations[1].answers[0].name)
    puts(self.answers[0].name)
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
    :axis_labels => [["A|C|L|R"]],
    )
    return @barra
  end

  def get_google_chart_line
    #aca voY!!! 
    @same_evaluations = self.get_same_evaluations
    @final_scores = []
    @same_evaluations.each do |evaluation|
      @scores = evaluation.get_score
      @name = User.find_by(id:evaluation.user_id).name

    end
    data_array_1 =  [1,4,3,5,9]
    data_array_2 = [4,2,10,4,7]
    @barra = Gchart.line(
    :size => '500x350',
    :bar_colors => ['000000','0088FF','FFFFFF'],
    :title => "Comparación profesores",
    :bg => 'EFEFEF',
    :legend => ['Mujeres','Hombres', 'Mujeres2'],
    :data => [[10,6,3,8,9],data_array_2,data_array_1],
    :stacked => false,
    :legend_position => 'bottom',
    :axis_with_labels => [['x'], ['y']],
    :max_value => 5.0,
    :min_value =>0.0,
    :axis_labels => [["A|C|L|R"]],
    )
    return @barra
  end



end
