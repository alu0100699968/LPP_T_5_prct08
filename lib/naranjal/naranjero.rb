module Naranjal


  class Naranjero

    EDAD_MAX = 20

    attr_accessor :edad, :altura, :naranjas

    def initialize

      @edad = 0
      @altura = 0
      @naranjas = 0

    end

    def vivo
      @edad < EDAD_MAX
    end

    def uno_mas

      return unless vivo
      @edad += 1
      @altura += 10

      @naranjas = @edad ** 2 if @edad >= 4

    end

    def numero_naranjas
      @naranjas
    end

    def recolectar_una

      if !vivo
        puts 'Naranjo muerto :('
      elsif @naranjas > 0
        @naranjas -= 1
        puts 'Hay una deliciosa naranja.'
      elsif @naranjas == 0
        puts 'No hay naranjas :('
      end
    end

  end

  naranjito = Naranjero.new
  mutex = Mutex.new
  cv = ConditionVariable.new

  crecer_naranjo = Thread.new do
    until (naranjito.edad == Naranjero::EDAD_MAX)
      dormir = rand(0..0)
      puts "Crecer naranjo se va a dormir #{dormir}"
      sleep(dormir)
      puts "Crecer naranjo se ha despertado despues de dormir #{dormir}"
      mutex.synchronize do
        naranjito.uno_mas
        puts "El arbol ha envejecido un anyo"
        cv.signal
      end
    end
    puts "El hilo crecer naranjo finaliza"
  end

  recolector = Thread.new do
    until (naranjito.edad == Naranjero::EDAD_MAX)
      dormir = rand(0..0)
      puts "El recolector se va a dormir #{dormir}"
      sleep(dormir)
      puts "El recolector se ha despertado despues de dormir #{dormir}"
      mutex.synchronize do
        naranjito.recolectar_una
        puts "El recolector espera..."
        if naranjito.vivo
          cv.wait(mutex)
        end
      end
    end
    puts "El hilo recolector finaliza"
  end

  threads = [crecer_naranjo,recolector]

  threads.each { |t| t.join }

end
