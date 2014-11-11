class Test

  include Comparable
  
  attr_accessor :pregunta, :correcta, :falsas

  def <=> (a)
    @pregunta<=>a.pregunta
    @correcta<=>a.correcta
    @falsas<=>a.falsas
  end

  def initialize(pregunta, correcta, falsas=nil)
    @pregunta = pregunta
    @correcta = correcta
    @falsas = falsas
  end

  def to_html
    opciones = @correcta+[@falsas]
    opciones = opciones.shuffle
    opciones=''
    opciones += %Q{<input type = "radio" value="#{opciones}" name=resp> #{options}\n}
    texto = %Q{{#{@pregunta}}<br/>{#{opciones}}}
  end

  def to_s
    texto = "#{@pregunta} #{@correcta} #{[@falsas]}"
  end

end
