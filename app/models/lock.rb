class Lock < ApplicationRecord
  belongs_to :user
	before_save :check_code 

  def check_code
		puts "check code"
		self.code = [*('a'..'z'),*('0'..'9')].shuffle[0,8].join unless self.code
	end


	def generate_code
		[*('a'..'z'),*('0'..'9')].shuffle[0,8].join
	end

end
