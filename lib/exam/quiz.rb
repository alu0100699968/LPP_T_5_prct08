module Exam

  class Quiz

    attr_accessor :nombre, :preguntas

    def initialize(nombre, &block)

      @nombre = nombre
      @preguntas = []
      @count = 0

      instance_eval &block

    end

    def question(nombre, opciones = {})
      respuestas = []
      opciones.each do |key, value|
        respuestas << value
      end
      pregunta = Test.new(nombre,opciones[:right],respuestas)

      @preguntas << pregunta

    end

    def wrong
      @count += 1
    end

    def run
      l = DList.new(@preguntas)

      e=Examen.new(l)

      i=Interfaz.new(e)

      i.examinar

    end

  end
end
