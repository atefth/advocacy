class Advocate < ApplicationRecord
	has_many :case_files
	def name
		return self.f_name + ' ' + self.l_name
	end
	
	def self.search(search)
	  where("f_name LIKE ?", "%#{search}%") or
	  where("l_name LIKE ?", "%#{search}%") or
	  where("dob LIKE ?", "%#{search}%") or
	  where("phone LIKE ?", "%#{search}%")
	end
end
