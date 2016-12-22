class Advocate < ApplicationRecord
	def name
		return self.f_name + ' ' + self.l_name
	end
end
