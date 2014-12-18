module Naranjal

 class Tiempo

    def initialize(naranjito, mutex, cv)
      @naranjito = naranjito
      @mutex = mutex
      @cv = cv
    end

    def tiempo_pasa
      crece = Thread.new do
        until (@naranjito.edad == Naranjero::EDAD_MAX)
          dormir = rand(0..4)
          puts "Crecer naranjo se va a dormir #{dormir}"
          sleep(dormir)
          puts "Crecer naranjo se ha despertado despues de dormir #{dormir}"
          @mutex.synchronize do
            @naranjito.uno_mas
            puts "El arbol ha envejecido un anyo"
            @cv.signal
          end
        end
        puts "El hilo crecer naranjo finaliza"
      end

      recolector = Thread.new do
        until (@naranjito.edad == Naranjero::EDAD_MAX)
          dormir = rand(0..4)
          puts "El recolector se va a dormir #{dormir}"
          sleep(dormir)
          puts "El recolector se ha despertado despues de dormir #{dormir}"
          @mutex.synchronize do
            @naranjito.recolectar_una
            puts "El recolector espera..."
            if @naranjito.vivo?
              @cv.wait(@mutex)
            end
          end
        end
        puts "El hilo recolector finaliza"
      end
      [crece,recolector]
    end

  end

tiempo = Tiempo.new(Naranjero.new, Mutex.new, ConditionVariable.new)
threads = tiempo.tiempo_pasa

threads.each {|t| t.join}

end