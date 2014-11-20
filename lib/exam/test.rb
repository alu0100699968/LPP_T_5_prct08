class Test

  include Comparable

  attr_accessor :pregunta, :correcta, :respuestas, :nivel

  def <=> (a)
    @nivel <=> a.nivel
  end

  def == (a)
    @pregunta==a.pregunta && @correcta==a.correcta && @respuestas==a.respuestas
  end

  def initialize(pregunta, correcta, respuestas, nivel=nil)
    @pregunta = pregunta
    @correcta = correcta
    @respuestas = respuestas.shuffle
    @nivel = nivel
  end

  def check_ans(c)
    return (c == @correcta)
  end

  def to_html
    opciones = @respuestas
    opciones=''
    opciones += %Q{<input type = "radio" value="#{opciones}" name=resp> #{options}\n}
    texto = %Q{{#{@pregunta}}<br/>{#{opciones}}}
  end

  def to_s
    texto = "Pregunta: #{@pregunta} \n"
    for i in 0..@respuestas.size-1
      texto = texto + "\t #{i+1}) #{@respuestas[i]} \n"
    end
    return texto
  end

end
