require 'exam/examen.rb'

class Interfaz

  attr_accessor :examen

  def initialize(e)
    @examen = e
  end

  def mostrar
    puts @examen.to_s
  end

  def responder
    a=[]
    for i in 0..@examen.size-1
      puts "Respuesta a la pregunta #{i+1}: "
      a=a+[gets.chomp]
    end
    @examen.check_exam(a)
  end

  def examinar
    mostrar
    responder
  end

end
