module Inverter

  def reverse(lista)
    aux = lista.map {|x| x}
    lista_invertida = Exam::DList.new(aux)
  end

end

class Exam::Examen; include Inverter; end
