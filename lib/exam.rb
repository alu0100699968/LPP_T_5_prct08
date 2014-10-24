require "exam/version"

module Exam
	class Test
		attr_accessor :pregunta, :correcta, :falsas

		def initialize(pregunta, correcta, falsas)
			@pregunta = pregunta
			@correcta = correcta
			@falsas = falsas
		end

		def to_html
			opciones = @correcta+[@falsas]
			opciones = opciones.shuffle
			opciones=''
      opciones += %Q{<input type = "checkbox" value="#{opciones}" name=0> #{options}\n}
    	texto = %Q{{#{@pregunta}}<br/>{#{opciones}}}
		end
	end
end
