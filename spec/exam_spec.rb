require 'spec_helper'
require "exam.rb"

module Exam
	describe Test do
		before :each do
			@p1=Test.new("CCAA de España", "17",["15","16","18"])
		end

		context "Pregunta" do
			it "Pregunta correctamente hecha" do
				@p1.pregunta.should eq("CCAA de España")
				@p1.correcta.should eq('17')
				@p1.falsas.should eq(['15','16','18'])
			end
		end

		context "Conversion" do
	  	it "Se puede generar html" do
				@p1.should respond_to :to_html
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

			falsas1 = ["#<Xyz:0xa000208>", "0", "Ninguna de las anteriores"]
			falsas2 = ["Falso"]
			falsas3 = ["1", "bob", "Ninguna de las anteriores"]
			falsas4 = ["Una constante", "Un objeto", "Ninguna de las anteriores"]
			falsas5 = ["Falso"]
			@p1 = Test.new("Cual es la salida del siguiente codigo Ruby? \n class Xyz \n def pots \n @nice \n end \n end \n xyz = Xyz.new \n p xyz.pots", "nil", falsas1)
			@p2 = Test.new("La siguiente definicion de un hash en Ruby es valida: \n hash_raro = { \n [1, 2, 3] => Object.new(), \n Hash.new => :toto \n }","Cierto", falsas2)
			@p3 = Test.new("Cual es la salida del siguiente codigo Ruby?","HEY!", falsas3)
			@p4 = Test.new("Cual es el tipo del objeto en el siguiente codigo Ruby? \n class Objeto \n end","Una instancia de la clase Class", falsas4)
			@p5 = Test.new("Es apropiado que una clase Tablero herede de una clase Juego","Cierto", falsas5)

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
end
