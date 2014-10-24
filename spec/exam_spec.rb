require 'spec_helper'
require 'exam'

module Exam
		describe 'Test' do
			before :each do
				@ex=Exam::Test.new("CCAA de España", "17",["15","16","18"])
			end

			context "Pregunta" do
				it "Pregunta correctamente hecha" do
					expect(@ex.pregunta).to eq("CCAA de España")
					expect(@ex.correcta).to eq('17')
					expect(@ex.falsas).to eq(['15','16','18'])
				end
			end

			context "Conversion" do
      	it "Se puede generar html" do
					expect(@ex).to respond_to :to_html
        end
      end

		end
end
