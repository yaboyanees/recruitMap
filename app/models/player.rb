require 'csv'
class Player < ActiveRecord::Base
	
	def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
		Player.create! row.to_hash
	  end
	end

end
