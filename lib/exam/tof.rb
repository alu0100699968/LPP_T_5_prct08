require 'exam/test.rb'

class ToF < Test

  def initialize (preguntas, correcta, nivel=nil)
    super(preguntas,correcta, nil, nivel)
    if @correcta=="V"
      @falsas="F"
    elsif @correcta=="F"
      @falsas="V"
    end
  end
end