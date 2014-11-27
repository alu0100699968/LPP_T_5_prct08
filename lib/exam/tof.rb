module Exam
  # create ToF that inherits Test
  class ToF < Test

    def initialize (preguntas, correcta, nivel=nil)
      super(preguntas,correcta, ["V","F"], nivel)
    end
  end
end
