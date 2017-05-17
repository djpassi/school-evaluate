# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Usuarios
u1 = User.create(name:'Diego Passi',email:'djpassi@uc.cl',password:'123456',password_confirmation:'123456',role:'User')
u2 = User.create(name:'David Galemiri',email:'dagalemiri@uc.cl',password:'123456',password_confirmation:'123456',role:'User')
u3 = User.create(name:'Juan Marquez',email:'jgmarquez@uc.cl',password:'123456',password_confirmation:'123456',role:'User')
u4 = User.create(name:'Felipe De La Fuente',email:'fadelafuente1@uc.cl',password:'123456',password_confirmation:'123456',role:'User')
u5 = User.create(name:'Director',email:'director@uc.cl',password:'123456',password_confirmation:'123456',role:'User')
u6 = User.create(name:'Jefe UTP',email:'utp@uc.cl',password:'123456',password_confirmation:'123456',role:'User')
u7 = User.create(name:'Profesor 1',email:'profesor1@uc.cl',password:'123456',password_confirmation:'123456',role:'User')
u8 = User.create(name:'Profesor 2',email:'profesor2@uc.cl',password:'123456',password_confirmation:'123456',role:'User')


#Pautas
p1 = SurveySchema.create(title:'Pauta Educacion Basica')
p2 = SurveySchema.create(title:'Pauta Educacion Media')

#Preguntas
q1 = Question.create(name:'La planificacion esta organizada en torno a una vision.',genre:'score')
q2 = Question.create(name:'Presenta objetivos que apuntan al desarrollo de aprendizajes en torno a un  tema.',genre:'score')
q3 = Question.create(name:'La planificación expresa aquellas preguntas, relaciones o conceptos que son claves para la comprensión del tema.
',genre:'score')
q4 = Question.create(name:'Presenta objetivos que apuntan al desarrollo de habilidades académicas.
',genre:'score')
q5 = Question.create(name:'Presenta objetivos que apuntan al desarrollo de habilidades socioemocionales.
',genre:'score')
q6 = Question.create(name:'Tiene una fundamentación que contextualiza los objetivos de aprendizaje con la Visión.
',genre:'score')
q7 = Question.create(name:'La secuencia de acciones está orientada al logro de los aprendizajes propuestos.
',genre:'score')
q8 = Question.create(name:'Comentarios extras',genre:'text')
