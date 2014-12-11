module Exam

  class Quiz

    attr_accessor :nombre, :preguntas

    def initialize(nombre, &block)

      @nombre = nombre
      @preguntas = []

      instance_eval &block

    end

    def question(nombre, opciones = {})
      respuestas = []
      respuestas << opciones[:right]
      respuestas << opciones[:wrong]
      pregunta = Test.new(nombre,opciones[:right],respuestas)

      @preguntas << pregunta

    end

    def run
      l = DList.new(@preguntas)

      e=Examen.new(l)

      i=Interfaz.new(e)

      i.examinar

    end

  end

end
