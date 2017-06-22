# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Usuarios
u1 = User.create(name:'Diego Passi',email:'djpassi@uc.cl',password:'123456',password_confirmation:'123456', image:'/images/diego.jpg')
u2 = User.create(name:'David Galemiri',email:'dagalemiri@uc.cl',password:'123456',password_confirmation:'123456', image:'/images/david.jpg')
u3 = User.create(name:'Juan Marquez',email:'jgmarquez@uc.cl',password:'123456',password_confirmation:'123456',image:'/images/nacho.jpg')
u4 = User.create(name:'Felipe De La Fuente',email:'fadelafuente1@uc.cl',password:'123456',password_confirmation:'123456', image:'/images/felipe.jpg')
u5 = User.create(name:'Director',email:'director@uc.cl',password:'123456',password_confirmation:'123456',role: :UTP)
u6 = User.create(name:'Jefe UTP',email:'utp@uc.cl',password:'123456',password_confirmation:'123456')
u7 = User.create(name:'Bastian Abarca',email:'bastian@uc.cl',password:'123456',password_confirmation:'123456', image:'/images/bastian.png')
u8 = User.create(name:'Freddy Rieloff',email:'freddy@uc.cl',password:'123456',password_confirmation:'123456', image:'/images/freddy.jpg')
u9 = User.create(name:'Agnes Ibanez',email:'agnes@uc.cl',password:'123456',password_confirmation:'123456', image:'/images/agnes_ibanez.jpg')
u10 = User.create(name:'Ana Bravo',email:'amb@uc.cl',password:'123456',password_confirmation:'123456', image:'/images/amb.jpg')
u11 = User.create(name:'Benedicto Gonzalez',email:'benedicto@uc.cl',password:'123456',password_confirmation:'123456', image:'/images/benedicto.jpg')
u12 = User.create(name:'Francisco Villaroes',email:'fvillaroel@uc.cl',password:'123456',password_confirmation:'123456', image:'/images/francisco_villaroel.jpg')
u13 = User.create(name:'Angela Cataldo',email:'ange@uc.cl',password:'123456',password_confirmation:'123456', image:'/images/inge.jpg')
u14 = User.create(name:'Jorge Astorga',email:'jorge@uc.cl',password:'123456',password_confirmation:'123456', image:'/images/jorge_astorga.jpg')
u15 = User.create(name:'Mar Perez',email:'mperez@uc.cl',password:'123456',password_confirmation:'123456', image:'/images/mar_perez.jpg')
u16 = User.create(name:'Maria Flores',email:'mflores@uc.cl',password:'123456',password_confirmation:'123456', image:'/images/maria_flores.jpg')
u17 = User.create(name:'Valeria Acevedo',email:'valeria@uc.cl',password:'123456',password_confirmation:'123456', image:'/images/valeria.jpg')









u9 = User.create(name:'admin',email:'admin@uc.cl',password:'123456',password_confirmation:'123456',role: :admin)


#Pautas


#Preguntas
q1 = Question.create(name:'La planificacion esta organizada en torno a una vision.',
	genre:'score', category: 0, skill: 'Preparación')
q2 = Question.create(name:'Presenta objetivos que apuntan al desarrollo de aprendizajes en torno a un  tema.',
	genre:'score', category: 0, skill: 'Enseñanza')
q3 = Question.create(name:'La planificación expresa preguntas, relaciones o conceptos que son claves para la comprensión del tema.',
	genre:'score', category: 0, skill: 'Responsabilidad')
q4 = Question.create(name:'Presenta objetivos que apuntan al desarrollo de habilidades académicas.',
	genre:'score', category: 1, skill: 'Enseñanza')
q5 = Question.create(name:'Presenta objetivos que apuntan al desarrollo de habilidades socioemocionales.',
	genre:'score', category: 1, skill: 'Buen ambiente')
q6 = Question.create(name:'Tiene una fundamentación que contextualiza los objetivos de aprendizaje con la Visión.',
	genre:'score', category: 2, skill: 'Enseñanza')
q7 = Question.create(name:'La secuencia de acciones está orientada al logro de los aprendizajes propuestos.',
	genre:'score', category: 2, skill: 'Preparación')
q8 = Question.create(name:'Comentarios extras',
	genre:'text', category: 2, skill: 'General')
