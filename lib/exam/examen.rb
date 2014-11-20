#Require para utilizar el Struct Node
require 'exam/d_list.rb'
require 'exam/tof.rb'


# create a Examen
class Examen

	attr_accessor :list

	def initialize(a)
		@list = a
	end

	def check_exam(a)
		list = @list.clone
		n = 0
		for i in 0..a.size-1
			p = list.popHead
			if (p.check_ans(a[i]))
				n = n+1
			end
		end
		return "#{n}/#{a.size}";
	end

	def to_s
		@list.to_s
	end

end