require "exam/version"

module Exam

	class test
		attr_reader :pregunta :respuesta
		def initialize(pregunta, respuesta)
			@pregunta = pregunta
			@respuesta = respuesta

		end
end
