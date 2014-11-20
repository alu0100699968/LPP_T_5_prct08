require 'spec_helper'
require "exam.rb"

module Exam
	describe Test do
		before :each do
			@p1=Test.new("CCAA de Espanya", "17", ["15","16","18"], 1)
			@p2=Test.new("CCAA de Espanya", "17", ["15","16","18"], 2)
			@p3=Test.new("CCAA de Espanya", "18", ["15","16","18"], 3)
		end

		context "Pregunta" do
			it "Pregunta correctamente hecha" do
				@p1.pregunta.should eq("CCAA de Espanya")
				@p1.correcta.should eq('17')
				@p1.respuestas.should =~ ['15','16','18']
			end
		end

		context "Conversion" do
	  	it "Se puede generar html" do
				@p1.should respond_to :to_html
	    end
	  end

		context "Comparable" do
			it "Se puede comparar" do
				(@p1==@p2).should eq(true)
				(@p1==@p3).should eq(false)

				(@p1<@p3).should eq(true)
				(@p3<@p1).should eq(false)

				(@p1<=@p3).should eq(true)
				(@p3<=@p1).should eq(false)

				(@p3>@p1).should eq(true)
				(@p1>@p3).should eq(false)

				(@p3>=@p1).should eq(true)
				(@p1>=@p3).should eq(false)
			end
		end

	end

	describe ToF do
		before :each do
			@p1=ToF.new("Hoy es viernes","V")
			@p2=ToF.new("Hoy es jueves","F")
		end
		context "Verdadero o Falso" do
			it "Preguntas verdadero o falso correctamente realizadas" do
				@p1.pregunta.should eq("Hoy es viernes")
				@p1.correcta.should eq("V")
				@p1.respuestas.should =~ ["V","F"]

				@p2.pregunta.should eq("Hoy es jueves")
				@p2.correcta.should eq("F")
				@p2.respuestas.should =~ ["V","F"]
			end

			it "Hereda de Test" do #Dos alternativas para comprobar la herencia
				@p1.class.should be < Test
				expect(@p1).to be_kind_of(Test)
			end

			it "Hereda de Test" do
				expect(@p1.is_a? Test).to be(true)
			end

			it "No es una instancia de Test" do
				expect(@p1.instance_of? Test).to be(false)
			end
		end

	end

	describe Node do

		before :each do
			@n2 = Node.new("tail",nil)
			@n1 = Node.new("head",@n2)
		end

		describe "Node" do
			it "#Debe existir un Nodo de la lista con sus datos y su siguiente" do
				@n1[:value].should eql "head"
				@n1[:next].should eql @n2
			end
		end
	end

	describe List do

		before :each do
			@l1 = List.new([3,4,5])

			respuestas1 = ["nil","#<Xyz:0xa000208>", "0", "Ninguna de las anteriores"]
			respuestas3 = ["HEY","1", "bob", "Ninguna de las anteriores"]
			respuestas4 = ["Una instancia de la clase Class","Una constante", "Un objeto", "Ninguna de las anteriores"]

			@p1 = Test.new("Cual es la salida del siguiente codigo Ruby? \n class Xyz \n def pots \n @nice \n end \n end \n xyz = Xyz.new \n p xyz.pots", "nil", respuestas1)
			@p2 = ToF.new("La siguiente definicion de un hash en Ruby es valida: \n hash_raro = { \n [1, 2, 3] => Object.new(), \n Hash.new => :toto \n }","V")
			@p3 = Test.new("Cual es la salida del siguiente codigo Ruby?","HEY!", respuestas3)
			@p4 = Test.new("Cual es el tipo del objeto en el siguiente codigo Ruby? \n class Objeto \n end","Una instancia de la clase Class", respuestas4)
			@p5 = ToF.new("Es apropiado que una clase Tablero herede de una clase Juego","V")

			@l2 = List.new([@p1,@p2,@p3,@p4,@p5])

		end

		describe "Preguntas" do
			it "#Se almacenan las preguntas en la lista" do
				@l2.to_s.should eql "Lista:  #{@p1.to_s}  ->  #{@p2.to_s}  ->  #{@p3.to_s}  ->  #{@p4.to_s}  ->  #{@p5.to_s}"
			end
		end

		describe "List" do
			it "#Se extrae el primer elemento de la lista" do
				@l1.popHead
				@l1.head[:value].should eql 4
			end

			it "#Se puede insertar un elemento" do
				@l1.push("nuevo")
				@l1.to_s.should eql "Lista:  3  ->  4  ->  5  ->  nuevo"
			end

			it "#Se pueden insertar varios elementos" do
				@l1.push([6,7,8])
				@l1.to_s.should eql "Lista:  3  ->  4  ->  5  ->  6  ->  7  ->  8"
			end

			it "#Debe existir una Lista con su cabeza" do
				@l1.head[:value].should eql 3
			end

		end

	end

describe DList do

		before :each do
			@l1 = DList.new([5,4,3])

			respuestas1 = ["#<Xyz:0xa000208>", "0", "Ninguna de las anteriores"]
			respuestas3 = ["1", "bob", "Ninguna de las anteriores"]
			respuestas4 = ["Una constante", "Un objeto", "Ninguna de las anteriores"]

			@p1 = Test.new("Cual es la salida del siguiente codigo Ruby? \n class Xyz \n def pots \n @nice \n end \n end \n xyz = Xyz.new \n p xyz.pots", "nil", respuestas1, 1)
			@p2 = ToF.new("La siguiente definicion de un hash en Ruby es valida: \n hash_raro = { \n [1, 2, 3] => Object.new(), \n Hash.new => :toto \n }","V", 2)
			@p3 = Test.new("Cual es la salida del siguiente codigo Ruby?","HEY!", respuestas3, 3)
			@p4 = Test.new("Cual es el tipo del objeto en el siguiente codigo Ruby? \n class Objeto \n end","Una instancia de la clase Class", respuestas4, 4)
			@p5 = ToF.new("Es apropiado que una clase Tablero herede de una clase Juego","V", 5)

			@p6 = ToF.new("Es una pregunta sin sentido","V")

			@l2 = DList.new([@p5,@p4,@p3,@p2,@p1])

		end

		describe "Preguntas" do
			it "#Se almacenan las preguntas en la lista" do
				@l2.to_s.should eql "#{@p1.to_s} #{@p2.to_s} #{@p3.to_s} #{@p4.to_s} #{@p5.to_s}"
			end
			it "#Se almacenan las preguntas en la lista" do
				@l2.to_is.should eql "#{@p5.to_s} #{@p4.to_s} #{@p3.to_s} #{@p2.to_s} #{@p1.to_s}"
			end
		end

		describe "List" do
			it "#Se extrae el primer elemento de la lista" do
				@l1.popHead
				@l1.head[:value].should eql 4
			end

			it "#Se puede insertar un elemento" do
				@l1.pushHead("nuevo")
				@l1.to_s.should eql "nuevo 3 4 5"
				@l1.to_is.should eql "5 4 3 nuevo"
			end

			it "#Se pueden insertar varios elementos" do
				@l1.pushHead([2,1,0])
				@l1.to_s.should eql "0 1 2 3 4 5"
				@l1.to_is.should eql "5 4 3 2 1 0"
			end

			it "#Debe existir una Lista con su cabeza" do
				@l1.head[:value].should eql 3
			end

			it "#Funciona enumerable" do
				@l1.find {|i| i == 3}.should eq(3)
				@l1.find {|i| i == 2}.should eq(nil)
				@l1.count.should eq(3)
				@l1.all?.should eq(true)
				@l1.max.should eq(5)
			end

			it "#Funciona enumerable con lista de preguntas" do
				@l2.find {|i| i == @p1}.should eq(@p1)
				@l2.find {|i| i == @p6}.should eq(nil)
				@l2.count.should eq(5)
				@l2.all?.should eq(true)
				@l2.max.should eq(@p5)
			end

		end

	end


	describe Examen do
		before :each do
			respuestas1 = ["#<Xyz:0xa000208>", "0", "Ninguna de las anteriores"]
			respuestas3 = ["1", "bob", "Ninguna de las anteriores"]
			respuestas4 = ["Una constante", "Un objeto", "Ninguna de las anteriores"]

			@p1 = Test.new("Cual es la salida del siguiente codigo Ruby? \n class Xyz \n def pots \n @nice \n end \n end \n xyz = Xyz.new \n p xyz.pots", "nil", respuestas1, 1)
			@p2 = ToF.new("La siguiente definicion de un hash en Ruby es valida: \n hash_raro = { \n [1, 2, 3] => Object.new(), \n Hash.new => :toto \n }","V", 2)
			@p3 = Test.new("Cual es la salida del siguiente codigo Ruby?","HEY!", respuestas3, 3)
			@p4 = Test.new("Cual es el tipo del objeto en el siguiente codigo Ruby? \n class Objeto \n end","Una instancia de la clase Class", respuestas4, 4)
			@p5 = ToF.new("Es apropiado que una clase Tablero herede de una clase Juego","V", 5)

			@l1 = DList.new([@p5,@p4,@p3,@p2,@p1])

			@e1=Examen.new(@l1)
		end

		context "Pruebas de la clase Examen" do
			it "Comprobación de preguntas hecha" do
				@e1.check_exam(["nil","V","HEY!","Una instancia de la clase Class","V"]).should eq("5/5")
				@e1.check_exam(["n","V","HEY!","Una instancia de la clase Class","V"]).should eq("4/5")
				@e1.check_exam(["n","F","HEY!","Una instancia de la clase Class","V"]).should eq("3/5")
				@e1.check_exam(["n","F","HEY","Una instancia de la clase Class","V"]).should eq("2/5")
				@e1.check_exam(["n","F","HEY","Una instancia de la clase String","V"]).should eq("1/5")
				@e1.check_exam(["n","F","HEY","Una instancia de la clase String","F"]).should eq("0/5")
			end
			it "Comprobación de tamaño" do
				@e1.size.should eq(5)
			end
			it "Comprobación de tamaño" do
				@e1.to_s.should eq("#{@p1.to_s} #{@p2.to_s} #{@p3.to_s} #{@p4.to_s} #{@p5.to_s}")
			end
		end


	end

	describe Interfaz do
		before :each do
			respuestas1 = ["#<Xyz:0xa000208>", "0", "Ninguna de las anteriores"]
			respuestas3 = ["1", "bob", "Ninguna de las anteriores"]
			respuestas4 = ["Una constante", "Un objeto", "Ninguna de las anteriores"]

			@p1 = Test.new("Cual es la salida del siguiente codigo Ruby? \n class Xyz \n def pots \n @nice \n end \n end \n xyz = Xyz.new \n p xyz.pots", "nil", respuestas1, 1)
			@p2 = ToF.new("La siguiente definicion de un hash en Ruby es valida: \n hash_raro = { \n [1, 2, 3] => Object.new(), \n Hash.new => :toto \n }","V", 2)
			@p3 = Test.new("Cual es la salida del siguiente codigo Ruby?","HEY!", respuestas3, 3)
			@p4 = Test.new("Cual es el tipo del objeto en el siguiente codigo Ruby? \n class Objeto \n end","Una instancia de la clase Class", respuestas4, 4)
			@p5 = ToF.new("Es apropiado que una clase Tablero herede de una clase Juego","V", 5)

			@l1 = DList.new([@p5,@p4,@p3,@p2,@p1])

			@e1=Examen.new(@l1)

			@i1=Interfaz.new(@e1)

		end

		context "Pruebas de la clase Interfaz" do

			it "Se muestran las preguntas" do
				@i1.mostrar.should eq(puts @examen.to_s)
			end

			it "Se realizan las preguntas:" do
				@i1.stub(:gets).and_return("nil\n","V\n","HEY!\n","Una instancia de la clase Class\n","V\n")
				@i1.responder.should eq("5/5")
			end
		end
	end
end
