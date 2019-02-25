=begin
Pequeña aplicación de Linea de Comando
1. Se le da la bienvenida al usuario.
2. El programa muestra la palabra definición, seguida de la respectiva descripción.
3. El programa le permite al usuario ingresar la respuesta con la palabra "Adivinar:"
  Si el usuario adivina la respuesta, ir al punto 2.
  De lo contrario, el usuario debe intentar responder de nuevo, ir al punto 3.
4. Fin del juego
  El juego termina cuando el usuario responde todas las preguntas establecidas en el reto.
=end

module Strings

  def welcome
    puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!"
  end

  def correct_ans
    puts'Correcto!'     
  end
  
  def wrong_ans
    puts "Incorrecto!, Trata de nuevo"
  end

  def definition
    sleep 1
    puts "Definición"
  end

  def guess
    print "Adivinar: "
    @answer = gets.downcase
  end

  def end_game
    puts 'ENHORABUENA! Eres un ganador. FIN del JUEGO'
  end

end

class Application

  include Strings
  attr_reader :questions

  def initialize
    @questions = questions
    @length = @questions.length
  end

  def question
    puts @questions[@index]
  end

  def loop_check
    while @answer != @questions[@index+1]
      wrong_ans
      guess
    end
  end

  # Aquí se almacena la lógica del juego
  def game
    @index = 0
    while @index < @length do 
      definition
      question
      guess
      loop_check
      correct_ans
      @index = @index + 3
    end 
  end
  
  # Da inicio al juego
  def start
    welcome
    game
    end_game
  end

  # Este método privado lee las líneas de preguntas.txt y almacena la información en un array
  private
    def questions
      @questions = IO.readlines("preguntas.txt")
    end

end


# Instanciando la clase
app = Application.new
app.start                    