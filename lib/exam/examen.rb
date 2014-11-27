module Exam
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

		def invertir
			@list=reverse(@list)
		end

		def size
			@list.size
		end

		def to_s
			@list.to_s
		end

	end
end
