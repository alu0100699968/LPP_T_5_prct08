require 'exam/test.rb'

class ToF < Test

  def initialize (preguntas, correcta)
    super(preguntas,correcta)
    if @correcta=="V"
      @falsas="F"
    elsif @correcta=="F"
      @falsas="V"
    end
  end
end