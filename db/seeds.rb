# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Usuarios
User.create(name:'Diego Passi',email:'djpassi@uc.cl',password:'123456',password_confirmation:'123456',role:'User')
User.create(name:'David Galemiri',email:'dagalemiri@uc.cl',password:'123456',password_confirmation:'123456',role:'User')
User.create(name:'Juan Marquez',email:'jgmarquez@uc.cl',password:'123456',password_confirmation:'123456',role:'User')
User.create(name:'Felipe De La Fuente',email:'fadelafuente1@uc.cl',password:'123456',password_confirmation:'123456',role:'User')
User.create(name:'Director',email:'director@uc.cl',password:'123456',password_confirmation:'123456',role:'User')
User.create(name:'Jefe UTP',email:'utp@uc.cl',password:'123456',password_confirmation:'123456',role:'User')
User.create(name:'Profesor 1',email:'profesor1@uc.cl',password:'123456',password_confirmation:'123456',role:'User')
User.create(name:'Profesor 2',email:'profesor2@uc.cl',password:'123456',password_confirmation:'123456',role:'User')


#Pautas
SurveySchema.create(title:'Pauta Educacion Basica')
SurveySchema.create(title:'Pauta Educacion Media')

#Preguntas
Question.create(name:'La planificacion esta organizada en torno a una vision.',genre:'score')
Question.create(name:'Presenta objetivos que apuntan al desarrollo de aprendizajes en torno a un  tema.',genre:'score')
Question.create(name:'La planificación expresa aquellas preguntas, relaciones o conceptos que son claves para la comprensión del tema.
',genre:'score')
Question.create(name:'Presenta objetivos que apuntan al desarrollo de habilidades académicas.
',genre:'score')
Question.create(name:'Presenta objetivos que apuntan al desarrollo de habilidades socioemocionales.
',genre:'score')
Question.create(name:'Tiene una fundamentación que contextualiza los objetivos de aprendizaje con la Visión.
',genre:'score')
Question.create(name:'La secuencia de acciones está orientada al logro de los aprendizajes propuestos.
',genre:'score')
Question.create(name:'Comentarios extras',genre:'text')
