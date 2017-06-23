# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Usuarios
arreglo = ['Preparación', 'Buen ambiente', 'Enseñanza', 'Responsabilidad']
u1 = User.create(name:'Diego Passi',email:'djpassi@uc.cl',password:'123123',password_confirmation:'123123', image:'/images/diego.jpg', cycle: "Primer ciclo", skill1:arreglo[0], skill2:arreglo[1])
u2 = User.create(name:'David Galemiri',email:'dagalemiri@uc.cl',password:'123123',password_confirmation:'123123', image:'/images/david.jpg', cycle: "Primer ciclo", skill1:arreglo[2], skill2:arreglo[3])
u3 = User.create(name:'Juan Marquez',email:'jgmarquez@uc.cl',password:'123123',password_confirmation:'123123',image:'/images/nacho.jpg', cycle: "Segundo ciclo", skill1:arreglo[2], skill2:arreglo[0])
u4 = User.create(name:'Felipe De La Fuente',email:'fadelafuente1@uc.cl',password:'123123',password_confirmation:'123123', image:'/images/felipe.jpg', cycle: "Segundo ciclo", skill1:arreglo[1], skill2:arreglo[3])
u5 = User.create(name:'Director',email:'director@uc.cl',password:'123123',password_confirmation:'123123',role: :UTP, cycle: "Segundo ciclo", skill1:arreglo[0], skill2:arreglo[3])
u6 = User.create(name:'Jefe UTP',email:'utp@uc.cl',password:'123123',password_confirmation:'123123', cycle: "Segundo ciclo", skill1:arreglo[1], skill2:arreglo[2])
u7 = User.create(name:'Bastian Abarca',email:'bastian@uc.cl',password:'123123',password_confirmation:'123123', image:'/images/bastian.png', cycle: "Tercer ciclo", skill1:arreglo[1], skill2:arreglo[3])
u8 = User.create(name:'Freddy Rieloff',email:'freddy@uc.cl',password:'123123',password_confirmation:'123123', image:'/images/freddy.jpg', cycle: "Tercer ciclo", skill1:arreglo[0], skill2:arreglo[2])
u9 = User.create(name:'Agnes Ibanez',email:'agnes@uc.cl',password:'123123',password_confirmation:'123123', image:'/images/agnes_ibanez.jpg', cycle: "Tercer ciclo", skill1:arreglo[0], skill2:arreglo[1])
u10 = User.create(name:'Ana Bravo',email:'amb@uc.cl',password:'123123',password_confirmation:'123123', image:'/images/amb.jpg', cycle: "Tercer ciclo", skill1:arreglo[0], skill2:arreglo[3])
u11 = User.create(name:'Benedicto Gonzalez',email:'benedicto@uc.cl',password:'123123',password_confirmation:'123123', image:'/images/benedicto.jpg', cycle: "Tercer ciclo", skill1:arreglo[1], skill2:arreglo[3])
u12 = User.create(name:'Francisco Villaroes',email:'fvillaroel@uc.cl',password:'123123',password_confirmation:'123123', image:'/images/francisco_villaroel.jpg', cycle: "Tercer ciclo", skill1:arreglo[0], skill2:arreglo[1])
u13 = User.create(name:'Angela Cataldo',email:'ange@uc.cl',password:'123123',password_confirmation:'123123', image:'/images/inge.jpg', cycle: "Tercer ciclo", skill1:arreglo[2], skill2:arreglo[3])
u14 = User.create(name:'Jorge Astorga',email:'jorge@uc.cl',password:'123123',password_confirmation:'123123', image:'/images/jorge_astorga.jpg', cycle: "Primer ciclo", skill1:arreglo[1], skill2:arreglo[3])
u15 = User.create(name:'Mar Perez',email:'mperez@uc.cl',password:'123123',password_confirmation:'123123', image:'/images/mar_perez.jpg', cycle: "Segundo ciclo", skill1:arreglo[2], skill2:arreglo[3])
u16 = User.create(name:'Maria Flores',email:'mflores@uc.cl',password:'123123',password_confirmation:'123123', image:'/images/maria_flores.jpg', cycle: "Primer ciclo", skill1:arreglo[0], skill2:arreglo[1])
u17 = User.create(name:'Valeria Acevedo',email:'valeria@uc.cl',password:'123123',password_confirmation:'123123', image:'/images/valeria.jpg', cycle: "Primer ciclo", skill1:arreglo[1], skill2:arreglo[2])

u18 = User.create(name:'admin',email:'admin@uc.cl',password:'123123',password_confirmation:'123123',role: :admin)


#NO BORRAR, ES NECESARIA PARA EL MODELO Comentarios extras .

q0 = Question.create(name:'Comentarios extras',genre:'text', category: 2, skill: 'General')

#Preparacion

q1 = Question.create(name:'El profesor realiza planificación de acuerdo al Curriculum nacional. ', genre:'score', category: 0, skill: 'Preparación')
q2 = Question.create(name:'El profesor escoge actividades se encuentran vinculadas con el objetivo de la clase.', genre:'score', category: 1, skill: 'Preparación')
q3 = Question.create(name:'El profesor realiza síntesis de los contenidos trabajos en el aula.', genre:'score', category: 2, skill: 'Preparación')
q4 = Question.create(name:'La actividad de activación de conocimientos previos se encuentra relacionados con los intereses y contexto del estudiante.', genre:'score', category: 0, skill: 'Preparación')
q5 = Question.create(name:'Los ejemplos que utiliza el docente para enseñar los contenidos se encuentran vinculados a los intereses y contexto de los estudiantes. ', genre:'score', category: 1, skill: 'Preparación')
q6 = Question.create(name:'Los estudiantes pueden dar un uso práctico o cotidiano a los contenidos aprendidos en el aula.', genre:'score', category: 2, skill: 'Preparación')
q7 = Question.create(name:'El profesor utiliza diversos recursos (tecnológico, bibliográficos, fuentes, filmes entre otros.) para la activación de conocimientos previos.', genre:'score', category: 0, skill: 'Preparación')
q8 = Question.create(name:'El docente desarrolla diversas actividades de aprendizajes para que los estudiantes logren el objetivo de la clase.', genre:'score', category: 1, skill: 'Preparación')
q9 = Question.create(name:'El profesor intenciona una de las habilidades de la disciplina en el término de la clase.', genre:'score', category: 2, skill: 'Preparación')
q10 = Question.create(name:'El objetivo de la clase posee coherencia con las sesiones anteriores. ', genre:'score', category: 0, skill: 'Preparación')
q11 = Question.create(name:'Las actividades intentan abarcar los diversos intereses y estilos de aprendizajes de los estudiantes.', genre:'score', category: 1, skill: 'Preparación')
q12 = Question.create(name:'Las actividades de evaluación abarcan los diversos estilos de aprendizajes (Kinestésico, visual y auditivo)', genre:'score', category: 1, skill: 'Preparación')

#Buen ambiente
q13 = Question.create(name:'El docente promueva las actitudes cívicas para el desarrollo de la clase.', genre:'score', category: 0, skill: 'Buen ambiente')
q14 = Question.create(name:'El docente repite y fomenta la práctica de las actitudes cívicas.', genre:'score', category: 1, skill: 'Buen ambiente')
q15 = Question.create(name:'El docente realiza un análisis sobre el clima del aula que permite lograr los aprendizajes.', genre:'score', category: 2, skill: 'Buen ambiente')
q16 = Question.create(name:'El docente enseña e inspira a sus estudiantes al iniciar la clase.', genre:'score', category: 0, skill: 'Buen ambiente')
q17 = Question.create(name:'El docente realiza refuerzo positivo a los estudiantes.', genre:'score', category: 1, skill: 'Buen ambiente')
q18 = Question.create(name:'El docente felicita los logros y menciona las áreas de crecimiento a mejorar de los estudiantes.', genre:'score', category: 2, skill: 'Buen ambiente')
q19 = Question.create(name:'El docente enuncia las reglas de convivencia al iniciar la clase.', genre:'score', category: 0, skill: 'Buen ambiente')
q20 = Question.create(name:'El docente repite y fomenta la práctica de las reglas de convivencia.', genre:'score', category: 1, skill: 'Buen ambiente')
q21 = Question.create(name:'El docente realiza un análisis sobre el clima del aula que permite lograr los aprendizajes.', genre:'score', category: 2, skill: 'Buen ambiente')
q22 = Question.create(name:'El docente se preocupa por el orden y aseo de la sala. ', genre:'score', category: 0, skill: 'Buen ambiente')
q23 = Question.create(name:'El docente deja ordenada y limpia la sala para la siguiente clase.', genre:'score', category: 2, skill: 'Buen ambiente')


#Enseñanza

q24 = Question.create(name:'El docente escribe y pronuncia el objetivo de la clase.', genre:'score', category: 0, skill: 'Enseñanza')
q25 = Question.create(name:'El docente vincula el contenido con el objetivo de la clase.', genre:'score', category: 1, skill: 'Enseñanza')
q26 = Question.create(name:'El docente vincula el cierre de la clase con el objetivo de aprendizaje.', genre:'score', category: 2, skill: 'Enseñanza')
q27 = Question.create(name:'El docente estimula el interés del estudiante en diversos momentos de la clase.', genre:'score', category: 1, skill: 'Enseñanza')
q28 = Question.create(name:'El docente posee un manejo acabado de los contenidos.', genre:'score', category: 1, skill: 'Enseñanza')
q29 = Question.create(name:'El docente marca el comienzo y termino de la etapa de inicio.', genre:'score', category: 0, skill: 'Enseñanza')
q30 = Question.create(name:'El docente marca el comienzo y termino del desarrollo.', genre:'score', category: 1, skill: 'Enseñanza')
q31 = Question.create(name:'El docente no realiza tiempo muerto en el aula.', genre:'score', category: 2, skill: 'Enseñanza')



#Responsabilidad

q32 = Question.create(name:'El profesor reflexiona sistemáticamente sobre su práctica.', genre:'score', category: 1, skill: 'Responsabilidad')
q33 = Question.create(name:'Construye relaciones profesionales y de equipo con sus colegas.', genre:'score', category: 1, skill: 'Responsabilidad')
q34 = Question.create(name:'Asume responsabilidades en la orientación de sus alumnos.', genre:'score', category: 1, skill: 'Responsabilidad')
q35 = Question.create(name:'Propicia relaciones de colaboración y respeto con los padres y apoderados.', genre:'score', category: 1, skill: 'Responsabilidad')
q36 = Question.create(name:'Maneja información actualizada sobre su profesión, el sistema educativo y las políticas vigentes.', genre:'score', category: 2, skill: 'Responsabilidad')




p1 = SurveySchema.create(title:'Pauta Primer Semestre Mineduc',cycle:'1')

p1.questions << q0
p1.questions << q1
p1.questions << q4
p1.questions << q6
p1.questions << q8
p1.questions << q10
p1.questions << q12
p1.questions << q14
p1.questions << q16
p1.questions << q18
p1.questions << q20
p1.questions << q24
p1.questions << q26
p1.questions << q28
p1.questions << q30
p1.questions << q34
p1.questions << q35
p1.questions << q36
