module Inverter

  def reverse(lista)
    aux = lista.map {|x| x}
    lista_invertida = DList.new(aux)
  end

end

class Examen; include Inverter; end
