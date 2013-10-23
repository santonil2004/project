class Category < ActiveRecord::Base
	has_many :posts

	validates:name, :description, {:presence=>true}

	def self.list_categories
		Category.all
	end
end
