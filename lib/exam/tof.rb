require 'exam/test.rb'

class ToF < Test

  def initialize (preguntas, correcta, nivel=nil)
    super(preguntas,correcta, ["V","F"], nivel)
  end
end