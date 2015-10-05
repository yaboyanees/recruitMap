class Team < ActiveRecord::Base

	has_many :players


	def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
		Team.create! row.to_hash
	  end
	end
	
end
