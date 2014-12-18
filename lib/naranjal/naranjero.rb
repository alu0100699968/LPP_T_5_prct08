module Naranjal


  class Naranjero

    EDAD_MAX = 10

    attr_accessor :edad, :altura, :naranjas

    def initialize

      @edad = 0
      @altura = 0
      @naranjas = 0

    end

    def vivo?
      @edad < EDAD_MAX
    end

    def uno_mas

      return unless vivo?
      @edad += 1
      @altura += 10

      @naranjas = @edad ** 2 if @edad >= 4

    end

    def numero_naranjas
      @naranjas
    end

    def recolectar_una

      if !vivo?
        puts 'Naranjo muerto :('
      elsif @naranjas > 0
        @naranjas -= 1
        puts 'Hay una deliciosa naranja.'
      elsif @naranjas == 0
        puts 'No hay naranjas :('
      end
    end
  end
end